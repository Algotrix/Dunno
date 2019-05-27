/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
var movement = 0;
var hitbox_visible = false;

switch (state)
{
	case "chase":
		set_state_sprite(s_zombie1_walk, spd_walk_image_speed, 0);
		if !instance_exists(o_player) exit;
		
		look_dir = sign(o_player.x - x);
		if(look_dir == 0) look_dir = 1;
		
		var distance = point_distance(x, y, o_player.x, o_player.y);

		if(distance > attack_distance)
		{
			movement = spd_walk * look_dir;
		}
		else
		{
			state = "attack";	
		}
	
		break;
	case "attack":
	{
		set_state_sprite(s_zombie1_attack, spd_attack, 0);
		
		// hitbox Fr 2 , 8
		
		if(animation_hit_frame(2))
		{
			dbg("hit12");
			create_hitbox(x, y, look_dir, self, s_zombie1_hitbox1, attack_hit1_knockback, 8, attack_hit1_dmg, hitbox_visible);
		}
	
		if(animation_hit_frame(7))
		{
			create_hitbox(x, y, look_dir, self, s_zombie1_hitbox2, attack_hit2_knockback, 8, attack_hit2_dmg, hitbox_visible);
		}
		break;
	}
	case "knockback":
	{
		set_state_sprite(s_zombie1_knockback, 1, 0);
		movement -= spd_knockback * look_dir;
		
		if(animation_end())
		{
			image_speed = 0;
			state = "chase";
		}
		break;
	}
}

image_xscale = look_dir;
velocity_x = movement;
move_and_collide(movement);