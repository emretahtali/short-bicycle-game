key_right = (keyboard_check(vk_right) || keyboard_check(ord("D")));
key_left = (keyboard_check(vk_left) || keyboard_check(ord("A")));
key_jump = (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")));
key_brake = keyboard_check(vk_space);

if (bike_state != state.succ)
{
	#region speeding

	if (place_meeting(x, y + 1, oWall))
	{
		//speeding up
		if (key_brake)
		{
			hsp = lerp(hsp, 0, .08);
			if (abs(hsp) > .5)
			{
				sprite_index = sPlayerTurn;
				angle = sign(hsp) * 30;
			}
			else
			{
				sprite_index = sPlayerIdle;
				angle = 0;
			}
		}
		else
		{
			hsp = lerp(hsp, (key_right - key_left) * walksp, .05);
		
			sprite_index = sPlayerIdle;
			angle = 0;
		}
	
		if (sign(hsp) == (key_right - key_left)) && (hsp != 0) && (!key_brake) bike_state = state.speeding;
		else bike_state = state.slowing;
	
		if (bike_state == state.speeding)
		{
			if (abs(hsp) > abs(walksp_init) - 3) walksp+= .2;
			sprite_index = sPlayerIdle;
			angle = 0;
		}
	
		on_ground = true;
	}
	else
	{
		bike_state = state.slowing;
	
		on_ground = false;
	}

	#endregion

	#region jump
	if (key_jump)
	{
		if (canjump > 0)
		{
			audio_sound_pitch(snJump, random_range(.95, 1.05));
			audio_play_sound(snJump, 0, false);
			vsp = -jumpsp;
			canjump = 0;
		}
		else if (collision_line(x, y, x, y + jumpbufferdis, oWall, false, true))
		{
			jumpbuffer = 60;
		}
	}

	vsp += grv;
	#endregion

	#region boing
	
	if (place_meeting(x, y, oBoing))
	{
		audio_sound_pitch(snJump, random_range(.95, 1.05));
		audio_play_sound(snJump, 0, false);
		vsp = -jumpsp * 2;
	}
	
	#endregion

	#region walls
	if (place_meeting(x + hsp, y, oWall))
	{
		while (!place_meeting(x + sign(hsp), y, oWall)) x += sign(hsp);
		hsp = 0;
		bike_state = state.slowing;
	}
	x += hsp;

	if (place_meeting(x, y + vsp, oWall))
	{
		while (!place_meeting(x, y + sign(vsp), oWall)) y += sign(vsp);
		vsp = 0;
	}
	y += vsp;
	#endregion

	#region anims and speeding

	if (sign(hsp) != 0) image_xscale = sign(hsp);

	if (on_ground)
	{
		if (key_right || key_left)
		{
			if (!cyclesoundlock)
			{
				audio_play_sound(snCycle, 0, true);
				cyclesoundlock = true;
			}
		}
		else if (cyclesoundlock)
		{
			audio_stop_sound(snCycle);
			cyclesoundlock = false;
		}
		
		if (hsp != 0)
		{			
			//sprite_index = sPlayerRun;
			idle_anim_reset = false;
		
			image_speed = abs(hsp) / walksp;
		
			if (image_speed != 0) image_speed = clamp(image_speed, .6, 1);
		}
		else
		{						
			image_speed = 1;
		
			sprite_index = sPlayerIdle;
			if (!idle_anim_reset)
			{
				idle_anim_reset = true;
				//image_index = 1;
			}
		}
	
		canjump = 5;
	
		if (jumpbuffer > 0)
		{
			audio_sound_pitch(snJump, random_range(.95, 1.05));
			audio_play_sound(snJump, 0, false);
			vsp = -jumpsp;
			jumpbuffer = 0;
		}
	}
	else
	{
		if (cyclesoundlock)
		{
			audio_stop_sound(snCycle);
			cyclesoundlock = false;
		}
		
		//sprite_index = sPlayerJump;
		//image_index = 1;
	
		if (canjump > 0) canjump --;
		if (jumpbuffer > 0) jumpbuffer --;
	}

	#endregion

	#region squash

	if (sign(hsp) != 0) && (sign(xscale) != sign(hsp)) xscale *= -1;

	var xscaletrg;
	var yscaletrg;

	if ((abs(xscale) > 1.19 /*1.198*/) || (land_scale_lock)) && (oPlayer.on_ground)
	{
		xscaletrg = sign(xscale);
		yscaletrg = sign(yscale);
		land_scale_lock = true;
	}
	else
	{
		xscaletrg = (1.2 - ((abs(vsp) / 8) * .35)) * sign(xscale);
		yscaletrg = (.8 + ((abs(vsp) / 5) * .3)) * sign(yscale);
		land_scale_lock = false;
	}

	yscaletrg = min(yscaletrg, 1.2);

	xscale = lerp(xscale, xscaletrg, .3);
	yscale = lerp(yscale, yscaletrg, .3);

	#endregion

	#region slowing state and whatnut

	if (bike_state == state.slowing)
	{
		walksp = walksp_init;
	
		if (key_right - key_left != 0) && ((key_right - key_left) == -1 * sign(hsp)) && (on_ground)
		{
			sprite_index = sPlayerTurn;
			angle = sign(hsp) * 30;
		}
	}

	#endregion

	#region collision checks for turning near a wall

	//if (place_meeting(x, y, oWall)) sprite_set_bbox(sPlayerIdle, bbox_turn[0], bbox_turn[1], bbox_turn[2], bbox_turn[3]);

	#endregion
}
else
{
	angle = lerp(angle, 360 * 4, .02);
	xscale = lerp(xscale, .2, .02);
	yscale = lerp(yscale, .2, .02);
	x = lerp(x, oEndPoint.x, .1);
	y = 32 + lerp(y - 32, oEndPoint.y, .1);
	alpha = lerp(alpha, 0, .06);
}