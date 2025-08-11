var shoot_rand = int64(random(40));
if shoot_rand == 0
{
	Enem_Shoot(Shoot_Type.target);
}

function Enem_Shoot(Shoot_Type, offset_x = 0, offset_y = 0){
	if Shoot_Type == Shoot_Type.target{
		var bull = instance_create_layer(x, y, "Instances", Enemy_Bullet_Normal);
		with(bull){
			speed = 4;
			direction = point_direction(x, y, Player_Ship.x, Player_Ship.y);
		}
	}
}