event_inherited();

// definition calculations
walk_spd_image_speed = walk_spd * 1.2;
walk_spd_damping_frame0 = walk_spd * 0.2
walk_spd_damping_frame1 = walk_spd * 0.5

run_spd_image_speed = run_spd * 0.5;
run_spd_damping_frame0 = walk_spd + ((run_spd - walk_spd) * 0.2)
run_spd_damping_frame1 = walk_spd + ((run_spd - walk_spd) * 0.66)

// states
state = "idle";
statecombo = "";

movement_jump_start = 0;

// instances
input = instance_create_layer(0, 0, "Instances", o_input);