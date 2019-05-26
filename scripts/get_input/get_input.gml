left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
jump = keyboard_check_pressed(vk_up);
attack1 = keyboard_check_pressed(vk_space);
attack2 = keyboard_check_pressed(vk_lcontrol);
notmoving = !left && !right

keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("J"), vk_space);
keyboard_set_map(ord("K"), vk_lcontrol);