/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
var movement = 0;

switch (state)
{
	case "chase":
		set_state_sprite(s_zombie1_walk, spd_walk_image_speed, 0);
		if !instance_exists(o_player) exit;
		
		look_dir = sign(o_player.x - x);
		if(look_dir == 0) look_dir = 1;
		
		image_xscale = look_dir;
		
		var distance = point_distance(x, y, o_player.x, o_player.y);

		if(distance > 20)
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
	}
}

x += movement;