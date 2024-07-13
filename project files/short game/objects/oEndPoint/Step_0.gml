image_angle += 2;
if (image_angle > 360) image_angle -= 360;

y = startY + 4 * sin(current_time/480);


if (!instance_exists(oCoin))
{
	if (place_meeting(x, y, oPlayer))
	{
		oPlayer.bike_state = state.succ;
		if (!lock)
		{
			alarm[0] = 40;
			lock = true;
		}
	}
	
	enab_alpha = lerp(enab_alpha, 1, .15);
}