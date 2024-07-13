hsp = 0;
vsp = 0;
walksp_init = 8;
walksp = 8;
jumpsp = 5;
grv = .4;
angle = image_angle;
alpha = 1;
//acc_sp = .05;

enum state
{
	slowing,
	speeding,
	succ
}

bike_state = state.slowing;

on_ground = false;
canjump = 5;
jumpbufferdis = 96;
jumpbuffer = 0;

land_scale_lock = true;
xscale = 1;
yscale = 1;

idle_anim_reset = false;

color = [211, 75, 252];

cyclesoundlock = false;

//bbox_idle = [sprite_get_bbox_left(sPlayerIdle), sprite_get_bbox_top(sPlayerIdle), sprite_get_bbox_right(sPlayerIdle), sprite_get_bbox_bottom(sPlayerIdle)];
//bbox_turn = [sprite_get_bbox_left(sPlayerTurn), sprite_get_bbox_top(sPlayerTurn), sprite_get_bbox_right(sPlayerTurn), sprite_get_bbox_bottom(sPlayerTurn)];