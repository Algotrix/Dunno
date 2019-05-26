// base definitions
spd_walk = 1;
spd_jump = 2.3; // how far you jump (speed while jumping)
spd_jump_image_speed = 1.2; // how long you stay in the air

spd_attack1 = 1;
spd_attack1combo = 2;
spd_attack2 = 1;

spd_idle_image_speed = 0.8;

// definition calculations
spd_walk_image_speed = spd_walk * 1.2;

// states
state = "move";
statecombo = "";
look_dir = 1;

// instances
input = instance_create_layer(0, 0, "Instances", o_input);