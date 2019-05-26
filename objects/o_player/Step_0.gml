var movement = 0;



#region "walking"
if(state == "walk_start")
{
	set_state_sprite(s_player_walk, spd_walk_image_speed, 0);
	
	if(animation_hit_frame_range(0, 0))
	{
		movement = spd_walk_damping_frame0 * look_dir;	
	}
	else if(animation_hit_frame_range(1, 2))
	{
		movement = spd_walk_damping_frame1 * look_dir;	
	}
	else if(image_index > 2)
	{
		state = "walk";
	}
}

if(state == "walk")
{
	if(input.notmoving || (input.move_left && look_dir = 1) || (input.move_right && look_dir = -1))
	{
		show_debug_message("input abort");
		state = "walk_end";
		reset_state_sprite(s_player_walk, spd_walk_image_speed, 10)
	}
	else if(input.move_right)
	{
		movement = spd_walk;
		look_dir = 1;
	}
	else if(input.move_left)
	{
		movement = -spd_walk;
		look_dir = -1;
	}
	else if(input.move_runright)
	{
		look_dir = 1;
		state = "run_start";
	}
	else if(input.move_runleft)
	{
		look_dir = -1;
		state = "run_start";
	}
}

if(state == "walk_end")
{
	//if(animation_hit_frame_range(10, 10))
	//{
	//	movement = spd_walk_damping_frame1 * look_dir;	
	//}
	//else if(animation_hit_frame_range(11, 11))
	//{
	//	movement = spd_walk_damping_frame0 * look_dir;	
	//}
	//else if(animation_hit_frame_range(0,7))
	//{
	state = "idle";
	//}
}
#endregion

#region "running
if(state == "run_start")
{
	set_state_sprite(s_player_run, spd_run_image_speed, 0);
	
	if(animation_hit_frame_range(0, 2))
	{
		movement = spd_run_damping_frame0 * look_dir;	
	}
	else if(animation_hit_frame_range(2, 4))
	{
		movement = spd_run_damping_frame1 * look_dir;	
	}
	else if(image_index > 3)
	{
		state = "run";
	}
}

if(state == "run")
{
	if(input.move_runright)
	{
		movement = spd_run;
		look_dir = 1;
	}
	else if(input.move_runleft)
	{
		movement = -spd_run;
		look_dir = -1;
	}
	else
	{
		show_debug_message("run abort");
		state = "run_end";
		reset_state_sprite(s_player_walk, spd_walk_image_speed, 10)
	}
}

if(state == "run_end")
{

	//if(animation_hit_frame_range(10, 10))
	//{
	//	movement = spd_walk_damping_frame1 * look_dir;	
	//}
	//else if(animation_hit_frame_range(11, 11))
	//{
	//	movement = spd_walk_damping_frame0 * look_dir;	
	//}
	//else if(animation_hit_frame_range(0,7))
	//{
	
	if(input.move_right || input.move_left)
	{
		state = "walk"
	}
	else if(input.move_runright || input.move_runleft)
	{
		state = "run";	
	}
	else
	{
		state = "idle";
	}
	
	//	state = "idle";
	//}
	

}


#endregion

#region "Idle"

if(state == "idle")
{
	set_state_sprite(s_player_idle, spd_idle_image_speed, 0)

	if (input.move_right)
	{
		state = "walk_start";
		look_dir = 1;
	}
	
	if (input.move_left) 
	{
		state = "walk_start";
		look_dir = -1;
	}
	
	if (input.runright)
	{
		state = "run_start";
		look_dir = 1;
	}

	if (input.runleft) 
	{
		state = "run_start";
		look_dir = -1;
	}
}
#endregion

dbg(state + " | l: " + string(input.move_left) + " | r: " + string(input.move_right) + " | rl: " + string(input.move_runleft) + " | rr: " + string(input.move_runright))
















// --- Alter Code

if (state == "move")
{

	
	if (input.runright)
	{
		movement = spd_run;
		image_xscale = 1;
		sprite_index = s_player_run;
		image_speed = spd_run_image_speed;
		look_dir = 1;
	}

	if (input.runleft) 
	{
		movement = -spd_run;
		image_xscale = -1;
		sprite_index = s_player_run;
		image_speed = spd_run_image_speed;
		look_dir = -1;
	}

	if (input.notmoving)
	{

	}
	
	// State Changes while moving
	
	if (input.jump)
	{
		state = "jump";
	}
	
	if (input.attack1)
	{
		state = "attack1";
	}
	
	if (input.attack2)
	{
		state = "attack2";
	}
}
#endregion

#region "State: Jumping"
if (state == "jump")
{
	set_state_sprite(s_player_jump, spd_jump_image_speed, 0);
	
	if(image_index <2)
	{
		//erste zwei Frames Absprung
		movement = spd_walk * look_dir;
	}
	else
	{
		movement = spd_jump * look_dir;
	}
}
#endregion

#region "State: Attacking"
if (state == "attack1")
{
	set_state_sprite(s_player_attack1, spd_attack1, 0);
	movement = 0;
	
	if (input.attack2 && animation_hit_frame_range(5, 8))
	{
		show_debug_message("att2");
		statecombo = "attack1combo";
	}
}

if (state == "attack2")
{
	set_state_sprite(s_player_attack2, spd_attack2, 0);
	movement = 0;
}

if (state == "move" && statecombo == "attack1combo")
{
	state = "attack1combo";
	statecombo = "";
}

if(state = "attack1combo")
{
	set_state_sprite(s_player_attack1, spd_attack1combo, 0);
	movement = 0
}

#endregion

image_xscale = look_dir;
move_and_collide(movement);