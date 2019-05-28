/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben



if(creator == noone || creator == other || !once("hit"))
{
	exit;	
}

other.hp -= damage;
ds_list_add(hit_objects, other);
other.state = "knockback";
other.spd_knockback = knockback * image_xscale;
dbg(other.hp);

