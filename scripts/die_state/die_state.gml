///@arg sprite

var sprite = argument0;

set_state_sprite(sprite, 1, 0);

movement = approach(movement, 0, 0.1);

if(animation_end())
{
	image_speed = 0;	
	is_corpse = true;
}

if(variable_instance_exists(self, "is_corpse") && wait("remove_corpse", die_corpsetime))
{
	instance_destroy(self);
}