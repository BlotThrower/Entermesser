if other.alive{
Player_Death();
}

function Player_Death(){
	instance_destroy();
	other.alive = false;
	var opleft = instance_find(Player_Option_Left, 0);
	opleft.visible = false;
	var opright = instance_find(Player_Option_Right, 0);
	opright.visible = false;
}