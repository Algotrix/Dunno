// Keys
key_left = vk_left;
key_right = vk_right;
key_run = vk_lshift;
key_jump = vk_up;
key_attack1 = vk_space;
key_attack2 = vk_lcontrol;

// Inputs
left = keyboard_check(key_left);
left_start = keyboard_check_pressed(key_left);
right = keyboard_check(key_right);
right_start = keyboard_check_pressed(key_right);
runmodifier = keyboard_check(key_run);
jump = keyboard_check_pressed(key_jump);
attack1 = keyboard_check_pressed(key_attack1);
attack2 = keyboard_check_pressed(key_attack2);

// Specials
notmoving = !left && !right
leftright = left && right

// Mappings
keyboard_set_map(ord("A"), key_left);
keyboard_set_map(ord("D"), key_right);
keyboard_set_map(ord("W"), key_jump);
keyboard_set_map(ord("J"), key_attack1);
keyboard_set_map(ord("K"), key_attack2);