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

if (active_spell_mode){
	active_speed = speed_active_spell;
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
		main_shot();
		option_shot();
}

var key_magic_attack_pressed = keyboard_check_pressed(ord("A"));
var key_magic_attack_held = keyboard_check(ord("A"));

var key_magic_attack_double = false;
if key_magic_attack_pressed {
	if alarm[0] < 0 {
		alarm[0] = 15;
	}
	else key_magic_attack_double = true;
}

if magic_attack_active && key_magic_attack_held{
		active_spell_mode = true;
		magic_attack_current.active_spell_mode_action();
}
else{
	active_spell_mode = false;
}

if key_magic_attack_pressed{
	if(magic_attack_active && key_magic_attack_double){
		instance_destroy(magic_attack_current);
		magic_attack_active = false;
	}
	else{
		magic_attack();	
	}
}

function main_shot(){
	if magic_attack_active {
		if fire_timer_normal <= 0 {
		instance_create_layer(x, y - 2, "Bullets", Player_Main_Bullet_Normal);
		}
	}
	else if active_speed == speed_normal && fire_timer_normal <= 0{
		instance_create_layer(x - 12, y - 2, "Bullets", Player_Main_Bullet_Normal)
		instance_create_layer(x + 12, y - 2, "Bullets", Player_Main_Bullet_Normal)
	}
	else if active_speed == speed_focused && fire_timer_focused <= 0{
		instance_create_layer(x - 12, y - 2, "Bullets", Player_Main_Bullet_Normal)
		instance_create_layer(x + 12, y - 2, "Bullets", Player_Main_Bullet_Normal)
	}
}

function option_shot(){
	if magic_attack_active {
		if fire_timer_normal <= 0 {
		var opt_shot_left = instance_create_layer(Player_Option_Left.x, Player_Option_Left.y, "Bullets", Player_Option_Bullet_Magic);
		with(opt_shot_left){
			direction = 90;
		}
		var opt_shot_right = instance_create_layer(Player_Option_Right.x, Player_Option_Right.y, "Bullets", Player_Option_Bullet_Magic);
		with(opt_shot_right){
			direction = 90;
		}
		fire_timer_normal = fire_rate_normal;
		}
	}
	else if active_speed == speed_normal && fire_timer_normal <= 0{
		instance_create_layer(x - 12, y - 2, "Bullets", Player_Main_Bullet_Normal)
		instance_create_layer(x + 12, y - 2, "Bullets", Player_Main_Bullet_Normal)
		with(instance_create_layer(Player_Option_Left.x, Player_Option_Left.y, "Bullets", Player_Option_Bullet_Normal)){
			direction = 92.5;
			image_angle = direction - 90;
		}
		with(instance_create_layer(Player_Option_Right.x, Player_Option_Right.y, "Bullets", Player_Option_Bullet_Normal)){
			direction = 87.5;
			image_angle = direction - 90;
		}
		fire_timer_normal = fire_rate_normal;
	}
	else if active_speed == speed_focused && fire_timer_focused <= 0{
		instance_create_layer(x - 12, y - 2, "Bullets", Player_Main_Bullet_Normal)
		instance_create_layer(x + 12, y - 2, "Bullets", Player_Main_Bullet_Normal)
		with(instance_create_layer(Player_Option_Left.x, Player_Option_Left.y, "Bullets", Player_Option_Bullet_Normal)){
			direction = 90;
		}
		with(instance_create_layer(Player_Option_Right.x, Player_Option_Right.y, "Bullets", Player_Option_Bullet_Normal)){
			direction = 90;
		}
		fire_timer_focused = fire_rate_focused;
	}
}

function magic_attack(){
	switch (magic_attack_active){
		case false:
		magic_attack_current = instance_create_layer(Player_Ship.x, Player_Ship.y, "Bullets", Magic_Circle);
		magic_attack_active = true;
		case true:
			return;
	}
}

function magic_attack2(current_direction){
	switch (magic_attack_active){
		case false:
		magic_attack_current = instance_create_layer(Player_Ship.x, Player_Ship.y, "Bullets", Player_Magic_Hook);
		magic_attack_active = true;
		case true:
			return;
	}
}