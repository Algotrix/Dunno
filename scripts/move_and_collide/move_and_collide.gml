///@arg movement
var movement = argument0;

if (place_meeting(x + movement, y, o_wall))
{

	while(place_meeting(x + movement, y, o_wall) && (movement != 0))
	{
			lastsign = sign(movement);
			movement -= sign(movement);
			if(lastsign != sign(movement))
			{
				movement = 0;
			}
			dbg(movement)
	}
}

x += movement;