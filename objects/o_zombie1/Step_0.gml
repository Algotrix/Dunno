movement = 0;
var hitbox_visible = false;

switch (state)
{
	case "chase":
		set_state_sprite(s_zombie1_walk, walk_spd_image_speed, 0);
		if !instance_exists(o_player) exit;
		
		look_dir = sign(o_player.x - x);
		if(look_dir == 0) look_dir = 1;
		
		var distance = point_distance(x, y, o_player.x, o_player.y);
		if(distance > release_distance)
		{
			state = "idle";
		}
		else if(between(distance, attack_distance, release_distance))
		{
			movement = walk_spd * look_dir;
		}
		else
		{
			state = "attack";	
		}
	
		break;
	case "attack":
	{
		set_state_sprite(s_zombie1_attack, attack1_spd, 0);
		
		// hitbox Fr 2 , 8
		
		if(animation_hit_frame(2))
		{
			create_hitbox(x, y, look_dir, self, s_zombie1_hitbox1, attack1_knockback, 8, attack1_dmg, hitbox_visible);
		}
	
		if(animation_hit_frame(7))
		{
			create_hitbox(x, y, look_dir, self, s_zombie1_hitbox2, attack2_knockback, 8, attack2_dmg, hitbox_visible);
		}
		break;
	}
	case "knockback":
	{
		knockback_state(s_zombie1_knockback, "chase");
		break;
	}
	case "idle":
	{
		set_state_sprite(s_zombie1_idle, attack1_spd, 0);
		
		var distance = point_distance(x, y, o_player.x, o_player.y);

		if(distance <= chase_distance)
		{
			state = "chase";
		}
		
	}
}

if(look_dir != 0) image_xscale = look_dir;
velocity_x = movement;
move_and_collide(movement);