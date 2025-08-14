var dmg = other.bullet_dmg;

HP = HP - dmg;
instance_destroy(other);
if HP <= 0{
	Death();
}

function Death(){
	instance_destroy();
	if(Hooked){
		Player_Magic_Hook.returning = true;
	}
}