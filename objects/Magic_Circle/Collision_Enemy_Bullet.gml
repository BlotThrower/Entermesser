if (variable_instance_exists(other, "Slowed") && other.Slowed == false){
	other.speed /= 2;
	other.Slowed = true;
}