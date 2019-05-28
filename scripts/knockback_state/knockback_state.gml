///@arg sprite
///@arg next_State

var _sprite = argument0;
var _next_state = argument1;
	
set_state_sprite(_sprite, 1, 0);
spd_knockback = approach(spd_knockback, 0, knockback_friction)
	
movement = spd_knockback;
look_dir = -sign(movement);
		
if(animation_end())
{
	image_speed = 0;
}
	
if(near(movement, 0, 0.1))
{
	movement = 0;
	state = _next_state;	
}
	