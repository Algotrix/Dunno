/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben



if(creator == noone || creator == other || ds_list_find_index(hit_objects, other) >= 0)
{
	exit;	
}

other.hp -= damage;
ds_list_add(hit_objects, other);
other.state = "knockback";
other.spd_knockback = knockback;
dbg(other.hp);