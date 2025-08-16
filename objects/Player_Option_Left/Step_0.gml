if(in_sequence){
	layer_sequence_x(seqElm, Player_Ship.x - 5);
	layer_sequence_y(seqElm, Player_Ship.y + 5);
	return;
}

if (Player_Ship.magic_attack_active){
	x = Magic_Circle.x - 45;
	y = Magic_Circle.y;
	return;
}

x = Player_Ship.x - 35;	
y = Player_Ship.y + 25;