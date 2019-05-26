///@arg movement
var movement = argument0;

if (place_meeting(x + movement, y, o_wall))
{
	while(place_meeting(x + movement, y, o_wall) && movement != 0)
	{
			movement -= look_dir;
	}
}

x += movement;