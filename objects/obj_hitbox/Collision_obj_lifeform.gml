if creator == noone or creator == other or ds_list_find_index(hit_object, other) != -1 
{
	exit;
}

other.health_ -= damage;
repeat(10)
{
	instance_create_layer(other.x, other.y - 12, "Effects", obj_hit_effect)
}

if instance_exists(obj_new_player) 
{
	if other.object_index == obj_new_player 
	{
		if other.health_ <= 0
		{
			var number = sprite_get_number(spr_laser_beam)
		
			for (var i = 0; i<number; i++;) 
			{
				var bx = other.x + random_range(-8, 8)
				var by = other.y + random_range(-24, 8)
				var bone = instance_create_layer(bx, by, "Instances", obj_player_death)
				bone.direction = 90 - (image_xscale * random_range(30, 60))
				bone.speed = random_range(3, 10)
				bone.image_xscale = i
			}
		}	
	}
	else 
	{
	other.alarm[0] = 120
	}
}

ds_list_add(hit_object, other)

