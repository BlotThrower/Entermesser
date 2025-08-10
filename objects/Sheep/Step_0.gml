var active_speed = keyboard_check(vk_control) ? speed_focused : speed_normal;

if keyboard_check(vk_left) && keyboard_check(vk_up){
	x = x - active_speed / sqrt(2);
	y = y - active_speed / sqrt(2);
}
else if keyboard_check(vk_left) && keyboard_check(vk_down){
	x = x - active_speed / sqrt(2);
	y = y + active_speed / sqrt(2);
}
else if keyboard_check(vk_right) && keyboard_check(vk_up){
	x = x + active_speed / sqrt(2);
	y = y - active_speed / sqrt(2);
}
else if keyboard_check(vk_right) && keyboard_check(vk_down){
	x = x + active_speed / sqrt(2);
	y = y + active_speed / sqrt(2);
}
else if keyboard_check(vk_left){
	x = x - active_speed;
}
else if keyboard_check(vk_right) {
	x = x + active_speed;
}
else if keyboard_check(vk_up){
	y = y - active_speed;
}
else if keyboard_check(vk_down){
	y = y + active_speed;
}

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

if fire_timer > 0 {
	fire_timer -= delta_time / 1000000;
}

if keyboard_check(vk_space) && fire_timer <= 0 {
	instance_create_layer(x - 12, y - 18, "Instances", Player_Main_Bullet_Normal)
	instance_create_layer(x + 12, y - 18, "Instances", Player_Main_Bullet_Normal)
	
	fire_timer = fire_rate;
}