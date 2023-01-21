function move(hspeed1, vspeed1)
{
hspeed_ = hspeed1
vspeed_ = vspeed1
//_text = "collisions.move"
//logflush(string(_text)+".horizcoll.close_to_collision: x = " + string(x))
//logflush(string(_text)+".verticoll.close_to_collision: y = " + string(y))
//logflush("provaloginfile")
//Horizontal collision	
if place_meeting(x + hspeed_, y, obj_wall_in_game)
{
	
	//logflush("collisions.move.horizcoll.close_to_collision: horizontal speed = " + string(hspeed_))
	while !place_meeting(x + sign(hspeed_), y, obj_wall_in_game)
	{
	//logflush("collisions.move.horizcoll.close_to_collision: increase x by 1")
		x += sign(hspeed_)
	}
	//logflush(string(_text)+".horizcoll.close_to_collision: x = " + string(x))
	//logflush(	string(_text) + ".horizcoll.close_to_collision: after collision")
	hspeed_ = 0
}
	//logflush(	string(_text) + ".horizcoll.close_to_collision: your not colliding")
x += hspeed_

//if place_meeting(x, y, obj_wall_in_game)
//{
//x -= 1
//}

if place_meeting(x, y + vspeed_, obj_wall_in_game)
{
	//logflush("collisions.move.verticoll.close_to_collision: vertical speed = " + string(vspeed_))
	while !place_meeting(x, y + sign(vspeed_), obj_wall_in_game)
	{
		//logflush("collisions.move.verticoll.close_to_collision: increase y by 1")
		y += sign(vspeed_)
	}
		//logflush(string(_text)+".verticoll.close_to_collision: y = " + string(y))

			//logflush(string(_text) + ".verticoll.close_to_collision: after collision")
	vspeed_ = 0
}
y += vspeed_
//logflush("non stai per collidere")
}