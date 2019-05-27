var movement = 0;

#region "Walking"
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
	
	if(input.jump)
	{
		state = "jump";	
	}
	
	if(input.attack1)
	{
		state = "attack1";
	}
	
	if(input.attack2)
	{
		state = "attack2";
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
	
	if(input.jump)
	{
		state = "jump";	
	}
	
	if(input.attack1)
	{
		state = "attack1";	
	}
	
	if(input.attack2)
	{
		state = "attack2";
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

#region "Running
if(state == "run_start")
{
	set_state_sprite(s_player_run, spd_run_image_speed, 0);
	
	if(animation_hit_frame_range(0, 1))
	{
		movement = spd_run_damping_frame0 * look_dir;	
	}
	else if(animation_hit_frame_range(1, 3))
	{
		movement = spd_run_damping_frame1 * look_dir;	
	}
	else if(image_index > 3)
	{
		state = "run";
	}
	
	if(input.jump)
	{
		state = "jump";	
	}
	
	if(input.attack1)
	{
		state = "attack1";
	}
	
	if(input.attack2)
	{
		state = "attack2";
	}
}

if(state == "run")
{
	if (input.notmoving || (input.move_runleft && look_dir = 1)
		|| (input.move_runright && look_dir = -1) 
		|| input.move_left || input.move_right)
	{
		show_debug_message("run abort");
		state = "run_end";
		reset_state_sprite(s_player_walk, spd_walk_image_speed, 10)
	}
	else if(input.move_runright)
	{
		movement = spd_run;
		look_dir = 1;
	}
	else if(input.move_runleft)
	{
		movement = -spd_run;
		look_dir = -1;
	}
	
	if(input.jump)
	{
		state = "jump";	
	}
	
	if(input.attack1)
	{
		state = "attack1";	
	}
	
	if(input.attack2)
	{
		state = "attack2";
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
	else
	{
		state = "idle";
	}
	
	//	state = "idle";
	//}
	

}


#endregion

#region "Attacking"
if(state == "attack1")
{
	movement = last_movement * 0.91;
	set_state_sprite(s_player_attack1, spd_attack1, 0);
	
	if(input.attack2 && animation_hit_frame_range(5, 8))
	{
		show_debug_message("att2");
		statecombo = "attack1combo";
	}
	
	if(animation_end())
	{
		if(statecombo == "attack1combo")
		{
			state = "attack1combo"
		}
		else
		{
			state = "idle";	
		}
	}
}

if(state == "attack1combo")
{
	if(statecombo != "")
	{
		reset_state_sprite(s_player_attack1, spd_attack1combo, 0);
		statecombo = "";
	}
	
	movement = last_movement * 0.8;

	if(animation_end())
	{
		state = "idle";	
	}
}

if(state == "attack2")
{
	movement = last_movement * 0.8;
	set_state_sprite(s_player_attack2, spd_attack1, 0);
	
	if(animation_end())
	{
		state = "idle";		
	}
}
#endregion

#region "Jumping"
if (state == "jump")
{
	set_state_sprite(s_player_jump, spd_jump_image_speed, 0);
	
	if(movement_jump_start == 0) movement_jump_start = last_movement;
	
	if(image_index < 2)
	{
		//erste zwei Frames Absprung
		movement = movement_jump_start;
	}
	else
	{
		movement = movement_jump_start * spd_jump_multi;
	}
	
	if(animation_end())
	{
		movement_jump_start = 0;
		state = "idle";
	}
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
	
	if (input.move_runright)
	{
		state = "run_start";
		look_dir = 1;
	}

	if (input.move_runleft) 
	{
		state = "run_start";
		look_dir = -1;
	}
	
	if(input.jump)
	{
		state = "jump";	
	}
	
	if(input.attack1)
	{
		state = "attack1";	
	}
	
	if(input.attack2)
	{
		state = "attack2";
	}
}


#endregion

//dbg(movement)
//dbg(state + " | " + "m: " + string(movement) + " | l: " + string(input.move_left) + " | r: " + string(input.move_right) + " | rl: " + string(input.move_runleft) + " | rr: " + string(input.move_runright))

image_xscale = look_dir;
last_movement = movement;
move_and_collide(movement);
