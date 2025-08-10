Player_Death();

function Player_Death(){
	instance_destroy();
	instance_destroy(other);
}