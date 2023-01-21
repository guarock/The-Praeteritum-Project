function move_push()
{
if place_meeting(x + hspeed_push, y, obj_wall_in_game)
{
	while !place_meeting(x + sign(hspeed_push), y, obj_wall_in_game)
	{
		x += sign(hspeed_push)
	}
	hspeed_push = 0
}
x += hspeed_push

if place_meeting(x, y + vspeed_push, obj_wall_in_game)
{
	while !place_meeting(x, y + sign(vspeed_push), obj_wall_in_game)
	{
		y += sign(vspeed_push)
	}
	vspeed_push = 0
}
y += vspeed_push
}