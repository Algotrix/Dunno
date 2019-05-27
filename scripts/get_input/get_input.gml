// Inputs
left = keyboard_check(vk_left);
left_start = keyboard_check_pressed(vk_left);
left_end = keyboard_check_released(vk_left);
right = keyboard_check(vk_right);
right_start = keyboard_check_pressed(vk_right);
right_end = keyboard_check_released(vk_right);
runmodifier = keyboard_check(vk_lshift);
runleft = keyboard_check(vk_left) && keyboard_check(vk_lshift);
runleft_start = (keyboard_check_pressed(vk_left) && keyboard_check(vk_lshift)) 
				|| (keyboard_check(vk_left) && keyboard_check_pressed(vk_lshift))
				|| (keyboard_check_pressed(vk_left) && keyboard_check_pressed(vk_lshift));
runleft_end = (keyboard_check_released(vk_left) && keyboard_check(vk_lshift)) 
				|| (keyboard_check(vk_left) && keyboard_check_released(vk_lshift))
				|| (keyboard_check_released(vk_left) && keyboard_check_released(vk_lshift));

runright = keyboard_check(vk_right) && keyboard_check(vk_lshift);
runright_start = (keyboard_check_pressed(vk_right) && keyboard_check(vk_lshift)) 
				|| (keyboard_check(vk_right) && keyboard_check_pressed(vk_lshift))
				|| (keyboard_check_pressed(vk_right) && keyboard_check_pressed(vk_lshift));
runright_end = (keyboard_check_released(vk_right) && keyboard_check(vk_lshift)) 
				|| (keyboard_check(vk_right) && keyboard_check_released(vk_lshift))
				|| (keyboard_check_released(vk_right) && keyboard_check_released(vk_lshift));
				
jump = keyboard_check_pressed(vk_up);
attack1 = keyboard_check_pressed(vk_space);
attack2 = keyboard_check_pressed(vk_lcontrol);
attack1_hold = keyboard_check(vk_space);
attack2_hold = keyboard_check(vk_lcontrol);

notmoving = !left && !right
leftright = left && right
abort_movement = (!left && !right) || (left_end && !right) || (right_end && !left)

// Mappings
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("J"), vk_space);
keyboard_set_map(ord("K"), vk_lcontrol);