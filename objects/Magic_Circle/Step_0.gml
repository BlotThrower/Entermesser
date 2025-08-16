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

if(Player_Ship.magic_attack_active){
phase_left += 9; phase_right += 9;
Player_Option_Left.x = x + radius_left * dcos(phase_left);
Player_Option_Left.y = y - radius_left * dsin(phase_left);
Player_Option_Right.x = x + radius_right * dcos(phase_right);
Player_Option_Right.y = y - radius_right * dsin(phase_right);
}