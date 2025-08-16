function active_spell_mode_action(){
	if keyboard_check(vk_left) && keyboard_check(vk_up){
	x = x - 3 / sqrt(2);
	y = y - 3 / sqrt(2);
}
else if keyboard_check(vk_left) && keyboard_check(vk_down){
	x = x - 3 / sqrt(2);
	y = y + 3 / sqrt(2);
}
else if keyboard_check(vk_right) && keyboard_check(vk_up){
	x = x + 3 / sqrt(2);
	y = y - 3 / sqrt(2);
}
else if keyboard_check(vk_right) && keyboard_check(vk_down){
	x = x + 3 / sqrt(2);
	y = y + 3 / sqrt(2);
}
else if keyboard_check(vk_left){
	x = x - 3;
}
else if keyboard_check(vk_right) {
	x = x + 3;
}
else if keyboard_check(vk_up){
	y = y - 3;
}
else if keyboard_check(vk_down){
	y = y + 3;
}

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);
}