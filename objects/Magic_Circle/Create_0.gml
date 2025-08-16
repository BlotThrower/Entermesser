Magic_Circle_Fire();
alarm[0] = 5;
radius_left = point_distance(x, y, x - 45, y);
phase_left = point_direction(x, y, x - 45, y);
radius_right = point_distance(x, y, x + 45, y);
phase_right = point_direction(x, y, x + 45, y);

function Magic_Circle_Fire(){
		x = Player_Ship.x;
		y = Player_Ship.y - 20
		visible = true;
		speed = 30;
		direction = 90;
}