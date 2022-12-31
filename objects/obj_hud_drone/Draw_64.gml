if not instance_exists(obj_drone) exit;
var hp_x = 8
var hp_y = 8
var hp_width = 198
var hp_height = 6
if instance_exists(obj_drone)
{
draw_health_ = lerp(draw_health_, obj_drone.health_, 0.2)
draw_max_health_ = obj_drone.max_health_
} else {
	draw_health_ =lerp(draw_health_, 0, 0.2)
}
var hp_percentage = draw_health_ / draw_max_health_
draw_rectangle_color(hp_x, hp_y, hp_x + (hp_width * hp_percentage), hp_y + hp_height,c_red, c_red, c_red, c_red, false);
draw_line_width_color(hp_x-1, hp_y-1, hp_x + hp_width, hp_y-1, 1, c_black, c_black)
draw_line_width_color(hp_x-1, hp_y + hp_height, hp_x + hp_width, hp_y + hp_height, 1, c_black, c_black)
draw_line_width_color(hp_x-1, hp_y-1, hp_x-1, hp_y + hp_height, 1, c_black, c_black)
draw_line_width_color(hp_x + hp_width, hp_y-1, hp_x + hp_width, hp_y + hp_height, 1, c_black, c_black)


