// Inherit the parent event
event_inherited();
var shoot_rand = int64(random(40));
if shoot_type != int64(Shoot_Type.none) && shoot_rand == 0
{
	Enem_Shoot(shoot_type, Enemy_Bullet_Normal, Bullet_Speed, 15, 15);
}
function Enter_Berserk(){
	Bullet_Speed = 25;
}