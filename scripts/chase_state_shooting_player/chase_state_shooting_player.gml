function chase_state_shooting_player()
{
	
	image_xscale = sign(obj_new_player.x-x)
	if image_xscale == 0
	{
		image_xscale = 1
	}
	var direction_facing = image_xscale
	var _distance_to_player = point_distance(x, y, obj_new_player.x, obj_new_player.y)
	
	show_debug_message("Distance player-enemy")
	
	if _distance_to_player <= distance_range
	{
		show_debug_message("Under distance range: "+string(_distance_to_player))
		if place_meeting(x + (direction_facing * chase_speed), y, obj_new_player)
			{
				state = "attack"
			}
		else if ((y-obj_new_player.y)<10)
			{
				x += direction_facing * chase_speed;	
			}
	}
}