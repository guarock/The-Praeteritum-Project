if not instance_exists(obj_new_player) exit;
if obj_new_player.gold = gold_number
{
if !instance_exists(obj_warp)
	{
	var inst = instance_create_depth(0, 0, -99999, obj_warp)
	inst.target_x = target_x
	inst.target_y = target_y
	inst.target_rm = target_rm
	}



}
