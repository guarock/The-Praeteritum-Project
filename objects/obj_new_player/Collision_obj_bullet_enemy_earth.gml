if shield = false
health_ -= 3
if current_gun = spr_gun_power_shot && ammo != max_ammo && max_ammo >= ammo
{
	ammo += 1
	
}
instance_destroy(other)