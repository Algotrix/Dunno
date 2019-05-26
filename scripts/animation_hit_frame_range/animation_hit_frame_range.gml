///@arg low
///@arg high
var low = argument0;
var high = argument1;

if low == high then return animation_hit_frame(low);
else return image_index >= low && image_index <= high;