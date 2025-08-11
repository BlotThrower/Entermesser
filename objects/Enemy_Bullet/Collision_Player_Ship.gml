if other.alive{
Player_Death();
}

function Player_Death(){
	instance_destroy();
	other.alive = false;
}