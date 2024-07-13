width = camera_get_view_width(view_camera[0]);
height = camera_get_view_height(view_camera[0]);

camera_set_view_size(view_camera[0],  width, height);

target = oPlayer;

list = ds_list_create();