// base definitions
spd_walk = 1;
spd_run = 2;
spd_jump = 2.3; // how far you jump (speed while jumping)
spd_jump_image_speed = 1.2; // how long you stay in the air

spd_attack1 = 1;
spd_attack1combo = 2;
spd_attack2 = 1;

spd_idle_image_speed = 0.8;

// definition calculations
spd_walk_image_speed = spd_walk * 1.2;
spd_walk_damping_frame0 = spd_walk * 0.2
spd_walk_damping_frame1 = spd_walk * 0.5

spd_run_image_speed = spd_run * 0.5;
spd_run_damping_frame0 = spd_walk + ((spd_run - spd_walk) * 0.33)
spd_run_damping_frame1 = spd_walk + ((spd_run - spd_walk) * 0.66)


// states
state = "idle";
statecombo = "";
staterunning = "";
look_dir = 1;

// instances
input = instance_create_layer(0, 0, "Instances", o_input);