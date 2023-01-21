if not instance_exists(obj_player) exit;
else if instance_exists(obj_player)
{
var camera_id = view_camera[0]
var view_witdth = camera_get_view_width(camera_id)
var view_height = camera_get_view_height(camera_id)
display_set_gui_size(view_witdth, view_height)

text_color = c_white
draw_health_ = obj_player.health_
draw_max_health_ = obj_player.max_health_
draw_set_font(f_one)
}