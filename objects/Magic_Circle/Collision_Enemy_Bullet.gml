if (variable_instance_exists(other, "Slowed") && other.Slowed == false){
	other.speed /= 2;
	other.Slowed = true;
	other.sprite_index = asset_get_index(sprite_get_name(other.sprite_index) + "_Slowed");
}