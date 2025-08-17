if other.alive{
Hit();
}

function Hit(){
	instance_destroy();
	other.Player_Death();
}