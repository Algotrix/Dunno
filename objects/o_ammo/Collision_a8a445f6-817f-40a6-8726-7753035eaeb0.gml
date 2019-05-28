/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben



if(creator == noone || creator == other)
{
	exit;	
}

other.hp -= damage;
other.state = "knockback";
other.spd_knockback = knockback * image_xscale;
instance_destroy(self);

