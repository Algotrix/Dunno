var movement = 0;

#region "State: Idle/Movement"
if (state == "move")
{
	if (input.right)
	{
		movement = spd_walk;
		image_xscale = 1;
		sprite_index = s_player_walk;
		image_speed = spd_walk_image_speed;
		look_dir = 1;
		
		if(animation_hit_frame(1)) show_debug_message(image_index);
	}

	if (input.left) 
	{
		movement = -spd_walk;
		image_xscale = -1;
		sprite_index = s_player_walk;
		image_speed = spd_walk_image_speed;
		look_dir = -1;
	}
	
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
		sprite_index = s_player_idle;
		image_speed = spd_idle_image_speed;
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

move_and_collide(movement);