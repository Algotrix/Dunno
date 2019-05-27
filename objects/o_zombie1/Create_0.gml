event_inherited();

// base definitions
spd_walk = 0.2;
spd_attack = 1;
spd_idle_image_speed = 0.8;

attack_distance = 15;
attack_hit1_knockback = 1;
attack_hit2_knockback = 1;
attack_hit1_dmg = 1;
attack_hit2_dmg = 1;

// definition calculations
spd_walk_image_speed = spd_walk * 9;

// states
state = "chase";
look_dir = 1;