if place_meeting( x, y, obj_new_player) && !instance_exists(obj_warp) && keyboard_check_pressed(vk_control)
	{
	var inst = instance_create_depth(0, 0, -99999, obj_warp)
	inst.target_x = target_x
	inst.target_y = target_y
	inst.target_rm = target_rm
	}



