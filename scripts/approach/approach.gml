///@arg current_value
///@arg target_value
///@arg change_amount
var current_value = argument0
var target_value = argument1
var change_amount = argument2

if(current_value < target_value)
{
	current_value = min(current_value + change_amount, target_value);	
}
else
{
	current_value = max(current_value - change_amount, target_value);	
}

return current_value;