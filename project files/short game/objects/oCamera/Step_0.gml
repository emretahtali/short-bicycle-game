//dostum eğer gelecekte yaşıyosan bu kodu anlamakta başarılar.
//az çok şu anlama geliyo: karakter listedeki bi önceki pozisyona daha yakınsa yeni pozisyonu o yap.
//bir sonraki pozisyona yakınsa yeni pozisyonu o yap.
if (abs(list[|list_pos][0] - (oPlayer.y)) > abs(list[|max(list_pos - 1, 0)][0] - (oPlayer.y))) && (list[|max(list_pos - 1, 0)][2])
{
	list_pos --;
}
else if (abs(list[|list_pos][0] - (oPlayer.y)) > abs(list[|min(list_pos + 1, ds_list_size(list) - 1)][0] - (oPlayer.y)))
{
	list_pos ++;
}

x = lerp(x, target.x, .1);
y = lerp(y, list[|list_pos][1], .04);

x = clamp(x, width / 2, room_width - width / 2);
//y = clamp(y, height / 2, room_height - height / 2);

/*
x = lerp(x, target.x, .1);
if (list[|4]) y = lerp(y, y_pin, .08);
else y = lerp(y, target.y, .08);

x = clamp(x, list[|0], list[|1]);
y = clamp(y, list[|2], list[|3]);*/

camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2);

//death
if (oPlayer.y > room_height) room_restart();