//movement state
//move towards the player
if instance_exists(obj_new_player)
{
if distance_to_object(obj_new_player) < 200
{
	state_ = ATTACK
}	

var dir = point_direction(x, y, obj_new_player.x, obj_new_player.y)
hspeed_ = lengthdir_x(speed_, dir)
vspeed_ = lengthdir_y(speed_, dir)
move(hspeed_, vspeed_)
}