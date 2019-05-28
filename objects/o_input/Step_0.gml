get_input();

if(left_start) last_key = vk_left;
if(right_start) last_key = vk_right;

last_key_left = last_key == vk_left;
last_key_right = last_key == vk_right;

// main variables for detecting if player should move left or right.
// handles pressing both keys simultaneously.

if(leftright)
{
	move_left = !runmodifier && last_key_left;
	move_right = !runmodifier && last_key_right;
	move_runleft = runmodifier && last_key_left;
	move_runright = runmodifier && last_key_right;
}
else
{
	move_left = !runmodifier && left;
	move_right = !runmodifier && right;
	move_runleft = runmodifier && left;
	move_runright = runmodifier && right;
}

move_walking = move_left || move_right;
move_running = move_runleft || move_runright;