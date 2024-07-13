ds_list_clear(list);
list_pos = 0;

//if (room != r6) room_goto(r6);

switch(room)
{
	case r0: default: ds_list_add(list, [382, 288, false]); break;
	case r1: ds_list_add(list, [302, 360, false], [430, 432, true]); break;
	case r5: ds_list_add(list, [382, 334, false], [462, 430, false], [558, 526, false], [654, 558, false], [750, 654, false], [846, 750, false], [942, 846, false], [1038, 942, false]); break;
}

x = target.x;
y = list[|list_pos][1];

/*var clampX1 = width / 2;
var clampX2 = room_width - width / 2;
var clampY1 = height / 2;
var clampY2 = room_height - height / 2;

switch(room)
{
	case r0: default: ds_list_add(list, clampX1, clampX2, clampY1, clampY2, true); break;
	case r1: ds_list_add(list, clampX1, clampX2, 360, 432, false); break;
	case r5: ds_list_add(list, clampX1, clampX2, clampY1, clampY2, false); break;
}*/

/*y_pin = target.y; // - height * (2 / 8);

x = target.x;
if (list[|4]) y = y_pin;
else y = target.y;*/