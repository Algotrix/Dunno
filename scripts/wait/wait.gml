///@arg token
///@arg calls
var token = argument0;
var calls = argument1;
var loop = true;

if(!variable_instance_exists(self, "__wait"))
{
	__wait = ds_map_create();
}

if(is_undefined(ds_map_find_value(__wait, token)))
{
	ds_map_add(__wait, token, calls);
	return false;
}

var call = ds_map_find_value(__wait, token);

if(call > 0)
{
	call -= 1
	ds_map_replace(__wait, token, call);
}

if(call == 0) return true;
return false;
