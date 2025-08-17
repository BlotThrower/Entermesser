var dmg = other.bullet_dmg;

HP = HP - dmg;
instance_destroy(other);
if HP <= 0{
	Death();
}

function Death(){
	instance_destroy();
	Token_Spawn();
	Game_Obj.Points += Points;
}

function Token_Spawn(){
	for (var i = 0; i < array_length(Tokens); i++){
		instance_create_layer(x,y,"Instances", Tokens[i]);
	}
}