// Inherit the parent event
event_inherited();
var shoot_rand = int64(random(20));
if shoot_type =! Shoot_Type.none && shoot_rand == 0
{
	Enem_Shoot(shoot_type, Enemy_Bullet_Normal, 5, 15, 15);
}