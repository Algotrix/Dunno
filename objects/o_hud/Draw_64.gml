/// @description Hier Beschreibung einfügen
if(!instance_exists(o_player)) exit;

player = o_player;
hearts = ceil(player.hp / 5);

for(i = 0; i < hearts ; i++)
{
	if(i = hearts - 1)
	{
		draw_sprite(s_heart16, 5 - (player.hp % 5), 16, 16 * (i + 1));	
	}
	else
	{
		draw_sprite(s_heart16, 0, 16, 16 * (i + 1)); 
	}
}