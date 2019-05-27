/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben


if(state == "flying")
{
	set_state_sprite(sprite, 1, 0);
	movement = move_dir;
}

image_xscale = sign(movement);
move_and_collide(movement);