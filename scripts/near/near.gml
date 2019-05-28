///@arg value
///@arg target
///@arg tolerance

_value = argument0;
_target = argument1;
_tolerance = argument2;

return(_value >= _target - _tolerance && _value <= _target + _tolerance);