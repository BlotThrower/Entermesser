active_spell_mode = false;
fire_rate_normal = 0.04;
fire_rate_focused = 0.05;
fire_timer_normal = 0;
fire_timer_focused = 0;
timer_mode_change = 0;
mode_change_sequence = 0.05;
speed_normal = 5;
speed_focused = 3;
speed_active_spell = 0.5;
active_speed = 0;
alive = true;
magic_attack_current = undefined;
magic_attack_active = false;
enum plr_direction {neutral, up, down, left, right, up_left, up_right, down_left, down_right, }

instance_create_layer(x - 5, y + 5, "Instances", Player_Option_Left);
instance_create_layer(x + 5, y + 5, "Instances", Player_Option_Right);

function Player_Death(){
	alive = false;
	visible = false;
	var opleft = instance_find(Player_Option_Left, 0);
	opleft.visible = false;
	var opright = instance_find(Player_Option_Right, 0);
	opright.visible = false;
	if (magic_attack_active != false) {
		magic_attack_active = false;
		instance_destroy(magic_attack_current); 
	}
	Game_Obj.Lives -= 1;
	if (Game_Obj.Lives >= 0) {
		Player_Respawn();
	}
}

function Player_Respawn() {
	alarm[1] = 40;
}