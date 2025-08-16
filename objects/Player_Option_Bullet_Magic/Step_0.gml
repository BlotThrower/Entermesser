if instance_exists(self) {
	if Player_Ship.magic_attack_active && y < Magic_Circle.y - 300{
		last_pos = Magic_Circle.y;
		instance_destroy();
	}
	else if y < last_pos - 300 {
		instance_destroy();
	}
}