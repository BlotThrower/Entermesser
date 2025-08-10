var dmg = other.bullet_dmg;

HP = HP - dmg;

if HP <= 0{
	Death();
}

function Death(){
	instance_destroy();
	instance_destroy(other);
}