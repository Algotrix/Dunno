///@arg x
///@arg y
///@arg look_dir
///@arg creator
///@arg sprite
///@arg knockback
///@arg lifespan
///@arg damage
///@arg visible

var _x = argument0;
var _y = argument1;
var _look_dir = argument2;
var _creator = argument3;
var _sprite = argument4;
var _knockback = argument5;
var _lifespan = argument6;
var _damage = argument7;
var _visible = argument8;

var hitbox = instance_create_layer(_x, _y, "Instances", o_hitbox);
hitbox.sprite_index = _sprite;
hitbox.creator = _creator;
hitbox.knockback = _knockback;
hitbox.damage = _damage;
hitbox.image_xscale = _look_dir;
hitbox.visible = _visible;

hitbox.alarm[0] = _lifespan;