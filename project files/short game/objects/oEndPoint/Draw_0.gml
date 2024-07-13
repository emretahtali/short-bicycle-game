draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_alpha(1);

draw_self();

draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, c_white, enab_alpha);