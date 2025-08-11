fire_rate_normal = 0.04;
fire_rate_focused = 0.05;
fire_timer_normal = 0;
fire_timer_focused = 0;
timer_mode_change = 0;
mode_change_sequence = 0.05;
speed_normal = 5;
speed_focused = 3;
active_speed = 0;
alive = true;

instance_create_layer(x - 5, y + 5, "Instances", Player_Option_Left);
instance_create_layer(x + 5, y + 5, "Instances", Player_Option_Right);
