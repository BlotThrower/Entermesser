if alive == false{
	visible = false;
	active_speed = 0;
	return;
}

var current_direction = plr_direction.up;
active_speed = keyboard_check(vk_control) ? speed_focused : speed_normal;

if keyboard_check_pressed(vk_control) || keyboard_check_released(vk_control){
	timer_mode_change = mode_change_sequence;
}

if keyboard_check(vk_left) && keyboard_check(vk_up){
	x = x - active_speed / sqrt(2);
	y = y - active_speed / sqrt(2);
	current_direction = plr_direction.up_left;
}
else if keyboard_check(vk_left) && keyboard_check(vk_down){
	x = x - active_speed / sqrt(2);
	y = y + active_speed / sqrt(2);
	current_direction = plr_direction.down_left;
}
else if keyboard_check(vk_right) && keyboard_check(vk_up){
	x = x + active_speed / sqrt(2);
	y = y - active_speed / sqrt(2);
	current_direction = plr_direction.up_right;
}
else if keyboard_check(vk_right) && keyboard_check(vk_down){
	x = x + active_speed / sqrt(2);
	y = y + active_speed / sqrt(2);
	current_direction = plr_direction.down_right;
}
else if keyboard_check(vk_left){
	x = x - active_speed;
	current_direction = plr_direction.left;
}
else if keyboard_check(vk_right) {
	x = x + active_speed;
	current_direction = plr_direction.right;
}
else if keyboard_check(vk_up){
	y = y - active_speed;
}
else if keyboard_check(vk_down){
	y = y + active_speed;
	current_direction = plr_direction.down;
}

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

if fire_timer_normal > 0 {
	fire_timer_normal -= delta_time / 1000000;
}

if fire_timer_focused > 0 {
	fire_timer_focused -= delta_time / 1000000;
}

if timer_mode_change > 0 {
	timer_mode_change -= delta_time / 1000000;
}

if keyboard_check(vk_space) && timer_mode_change <= 0 {
	shot(active_speed)
}

var key_magic_attack_pressed = keyboard_check_pressed(vk_alt);

var key_magic_attack_double = false;
if key_magic_attack_pressed {
	if alarm[0] < 0 {
		alarm[0] = 15;
	}
	else key_magic_attack_double = true;
}

if key_magic_attack_pressed{
	if(magic_attack_active && key_magic_attack_double){
		instance_destroy(magic_attack_current);
		magic_attack_active = false;
	}
	else{
		magic_attack(current_direction);	
	}
}

function shot(active_speed){
	if active_speed == speed_normal && fire_timer_normal <= 0{
		instance_create_layer(x - 12, y - 2, "Instances", Player_Main_Bullet_Normal)
		instance_create_layer(x + 12, y - 2, "Instances", Player_Main_Bullet_Normal)
		var opt_shot_left = instance_create_layer(Player_Option_Left.x, Player_Option_Left.y, "Instances", Player_Option_Bullet_Normal);
		with(opt_shot_left){
			direction = 92.5;
		}
		var opt_shot_right = instance_create_layer(Player_Option_Right.x, Player_Option_Right.y, "Instances", Player_Option_Bullet_Normal);
		with(opt_shot_right){
			direction = 87.5;
		}
		fire_timer_normal = fire_rate_normal;
	}
	else if active_speed == speed_focused && fire_timer_focused <= 0{
		instance_create_layer(x, y - 2, "Instances", Player_Main_Bullet_Focused)
		fire_timer_focused = fire_rate_focused;
	}
}

function magic_attack(current_direction){
	switch (magic_attack_active){
		case false:
		magic_attack_current = instance_create_layer(Player_Ship.x, Player_Ship.y, "Instances", Magic_Circle);
		with(magic_attack_current){
			visible = false;
		}
		magic_attack_current.Magic_Circle_Fire(current_direction);
		magic_attack_active = true;
		case true:
			return;
	}
}