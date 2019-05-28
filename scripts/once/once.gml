///@arg token
var token = argument0;

if(!variable_instance_exists(self, "__once"))
{
	__once = ds_list_create();
}

if(ds_list_find_index(__once, token) >= 0)
{
	return false;	
}
else
{
	ds_list_add(__once, token);
	return true;
}

