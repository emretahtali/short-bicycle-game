y = startY + 4 * sin(current_time/480);


if (place_meeting(x, y, oPlayer)) lock = true;

if (lock)
{
	image_xscale = lerp(image_xscale, 0, .2);
	image_yscale = lerp(image_yscale, 0, .2);
}

if (image_xscale < .1) instance_destroy();