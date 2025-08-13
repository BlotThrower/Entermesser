seqElm = layer_sequence_create("Instances", Player_Ship.x - 5, Player_Ship.y + 5, Option_Startup_Left);
seqInst = layer_sequence_get_instance(seqElm);
sequence_instance_override_object(seqInst, Player_Option_Left, self);