var hitbox_visible = false;
movement = 0;

#region "Push out of blocks"
if(place_meeting(x, y, o_wall))
{
	px_left = 0;
	px_right = 0;
	
	while(place_meeting(x - px_left, y, o_wall)) px_left += 1;	
	while(place_meeting(x + px_right, y, o_wall)) px_right += 1;	

	dbg("pxleft " + string(px_left))
	dbg("pxright " + string(px_right))
	
	if(px_left < px_right)
	{
		x -= 3//px_left;
	}
	else
	{
		x += 3//px_right;	
	}
}
#endregion

#region "Walking"
if(state == "walk_start")
{
	set_state_sprite(s_player_walk, walk_spd_image_speed, 0);
	
	if(animation_hit_frame_range(0, 0))
	{
		movement = walk_spd_damping_frame0 * look_dir;	
	}
	else if(animation_hit_frame_range(1, 2))
	{
		movement = walk_spd_damping_frame1 * look_dir;	
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
		reset_state_sprite(s_player_walk, walk_spd_image_speed, 10)
	}
	else if(input.move_right)
	{
		movement = walk_spd;
		look_dir = 1;
	}
	else if(input.move_left)
	{
		movement = -walk_spd;
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
	//	movement = walk_spd_damping_frame1 * look_dir;	
	//}
	//else if(animation_hit_frame_range(11, 11))
	//{
	//	movement = walk_spd_damping_frame0 * look_dir;	
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
	set_state_sprite(s_player_run, run_spd_image_speed, 0);
	
	if(animation_hit_frame_range(0, 1))
	{
		movement = run_spd_damping_frame0 * look_dir;	
	}
	else if(animation_hit_frame_range(1, 3))
	{
		movement = run_spd_damping_frame1 * look_dir;	
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
		reset_state_sprite(s_player_walk, walk_spd_image_speed, 10)
	}
	else if(input.move_runright)
	{
		movement = run_spd;
		look_dir = 1;
	}
	else if(input.move_runleft)
	{
		movement = -run_spd;
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
	//	movement = walk_spd_damping_frame1 * look_dir;	
	//}
	//else if(animation_hit_frame_range(11, 11))
	//{
	//	movement = walk_spd_damping_frame0 * look_dir;	
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
	movement = velocity_x * 0.91;
	set_state_sprite(s_player_attack1, attack1_spd, 0);
	
	if(animation_hit_frame(4))
	{
		create_hitbox(x, y, look_dir, self, s_player_attack1_hit, attack1_knockback, 8, attack1_dmg, hitbox_visible);
	}
	
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
		reset_state_sprite(s_player_attack1, attack1combo_spd, 0);
		statecombo = "";
	}
	
	if(animation_hit_frame(4))
	{
		create_hitbox(x, y, look_dir, self, s_player_attack1_hit, attack1combo_knockback, 8, attack1combo_dmg, hitbox_visible);
	}
	
	movement = velocity_x * 0.8;

	if(animation_end())
	{
		state = "idle";	
	}
}

if(state == "attack2")
{
	movement = velocity_x * 0.8;
	set_state_sprite(s_player_attack2, attack2_spd, 0);
	
	if(animation_hit_frame(3))
	{
		var ammo = instance_create_layer(x, y, "Instances", o_ammo);	
		ammo.sprite = s_player_attack2_ammo;
		ammo.move_dir = attack2_fly_spd * look_dir; 
		ammo.damage = attack2_dmg;
	}
	
	if(animation_end())
	{
		state = "idle";		
	}
}
#endregion

#region "Jumping"
if (state == "jump")
{
	set_state_sprite(s_player_jump, jump_image_speed_multi, 0);
	
	if(movement_jump_start == 0) movement_jump_start = velocity_x;
	
	if(image_index < 2)
	{
		//erste zwei Frames Absprung
		movement = movement_jump_start;
	}
	else
	{
		movement = movement_jump_start * jump_spd_multi;
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
	set_state_sprite(s_player_idle, idle_image_speed, 0)

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

if(state == "knockback")
{
	knockback_state(s_player_hit, "idle");
}


#endregion

//dbg(movement)
//dbg(state + " | " + "m: " + string(movement) + " | l: " + string(input.move_left) + " | r: " + string(input.move_right) + " | rl: " + string(input.move_runleft) + " | rr: " + string(input.move_runright))

if(look_dir != 0) image_xscale = look_dir;
velocity_x = movement;

move_and_collide(movement);
