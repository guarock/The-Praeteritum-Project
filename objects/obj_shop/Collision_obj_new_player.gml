/// @description Upgrades
if keyboard_check_pressed(vk_f5) && obj_new_player.gold >= 1  && obj_new_player.current_gun != spr_rocket_launcher
{
	obj_new_player.gold -= 1
obj_new_player.max_ammo += 5
}
if keyboard_check_pressed(vk_control) && obj_new_player.gold >= 2 && obj_new_player.max_health_ != 200
{
obj_new_player.gold -= 2
obj_new_player.max_health_ += 10
}
if keyboard_check_pressed(vk_f2) && obj_new_player.gold >= 2
{
obj_new_player.gold -= 2
obj_new_player.max_hspeed += 2
}