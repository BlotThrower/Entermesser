var player_speed = 3.5;

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

if keyboard_check(vk_left) && keyboard_check(vk_up){
	x = x - player_speed / sqrt(2);
	y = y - player_speed / sqrt(2);
}
else if keyboard_check(vk_left) && keyboard_check(vk_down){
	x = x - player_speed / sqrt(2);
	y = y + player_speed / sqrt(2);
}
else if keyboard_check(vk_right) && keyboard_check(vk_up){
	x = x + player_speed / sqrt(2);
	y = y - player_speed / sqrt(2);
}
else if keyboard_check(vk_right) && keyboard_check(vk_down){
	x = x + player_speed / sqrt(2);
	y = y + player_speed / sqrt(2);
}
else if keyboard_check(vk_left){
	x = x - player_speed;
}
else if keyboard_check(vk_right) {
	x = x + player_speed;
}
else if keyboard_check(vk_up){
	y = y - player_speed;
}
else if keyboard_check(vk_down){
	y = y + player_speed;
}
