if vspeed > 1
{
	vspeed *= -0.5
}
else
{
	vspeed = 0
	while !place_meeting(x, y, obj_wall_in_game)
	{
		y++
	}
gravity = 0
friction = 1
}