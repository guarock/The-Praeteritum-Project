if instance_exists(obj_controller)
{
if global.game_state = states.paused 
{
	exit
}
}
var dir = point_direction(x, y - 8, mouse_x, mouse_y)
if aiming = dir
{
draw_sprite_ext(current_gun, 0, x, y - 10 , free_shot_x, free_shot_y, aiming, image_blend, image_alpha)
}
draw_self()
