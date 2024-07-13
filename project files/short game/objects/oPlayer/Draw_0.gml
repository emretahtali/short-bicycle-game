/*shader_set(shColor);

var uColor = shader_get_uniform(shColor, "uColor");
shader_set_uniform_f(uColor, color[0], color[1], color[2]);

draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, c_white, 1);

shader_reset();*/

if (bike_state != state.succ) draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, angle, c_white, 1);
else draw_sprite_ext(sPlayerSucc, image_index, x, y - 32, xscale, yscale, angle, c_white, alpha);