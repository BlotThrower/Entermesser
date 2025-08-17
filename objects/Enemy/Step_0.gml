if Can_Berserk && Berserk_Check(){
	Enter_Berserk();
}

function Berserk_Check(){
	if HP == 0 && Mana_Load > 0 {
		return true;
	}
	return false;
}

function Enter_Berserk(){
		
}