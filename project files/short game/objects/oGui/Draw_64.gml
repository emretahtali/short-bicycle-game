draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_alpha(1);

if (global.debugmode)
{
	switch (oPlayer.bike_state)
	{
		case state.slowing: draw_text(60, 30, "slowing"); break;
		case state.speeding: draw_text(60, 30, "speeding"); break;
		case state.succ: draw_text(60, 30, "succ"); break;
	}

	if (place_meeting(oPlayer.x, oPlayer.y, oWall)) draw_text(60, 60, "colliding");
	else draw_text(60, 60, "not colliding");

	draw_text(60, 90, "walksp = " + string(oPlayer.walksp));
	draw_text(60, 120, "hsp = " + string(oPlayer.hsp));
}

//draw_text(60, 30, oPlayer.y);