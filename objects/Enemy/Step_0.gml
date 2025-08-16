function Enem_Shoot(Shoot_Type, Bullet_Type, bullet_speed, offset_x = 0, offset_y = 0){
	
	if (Bullet_Type != Enemy_Bullet && !object_is_ancestor(Bullet_Type, Enemy_Bullet)){
		show_message("enemy shot must be type of enemy bullet object");
		return;
	}
	
	if Shoot_Type == Shoot_Type.target{
		var bull = instance_create_layer(x, y, "Instances", Bullet_Type);
		with(bull){
			speed = bullet_speed;
			direction = point_direction(x, y, Player_Ship.x + offset_x, Player_Ship.y + offset_y);
		}
	}
	else if Shoot_Type == Shoot_Type.target_rough{
		var bull = instance_create_layer(x, y, "Instances", Bullet_Type);
		with(bull){
			speed = bullet_speed;
			var rough_off_x = random_range(-offset_x, offset_y);
			direction = point_direction(x, y, Player_Ship.x + rough_off_x, Player_Ship.y);
		}
	}
	else if Shoot_Type == Shoot_Type.set{
		var bull = instance_create_layer(x, y, "Instances", Bullet_Type);
		with(bull){
			speed = bullet_speed;
			direction = offset_x;
		}
	}
}

if Can_Berserk && Berserk_Check(){
	Enter_Berserk();
}

function Berserk_Check(){
	if HP == 0 && Mana_Load > 0 {
		return true;
	}
	return false;
}

function Enter_Berserk(){
		
}