if not instance_exists(obj_player) exit;
var hp_x = 8
var hp_y = 8
var hp_width = 792
var hp_height = 18
if instance_exists(obj_player)
{
draw_health_ = lerp(draw_health_, obj_player.health_, 0.2)
draw_max_health_ = obj_player.max_health_
} else {
	draw_health_ =lerp(draw_health_, 0, 0.2)
}
var hp_percentage = draw_health_ / draw_max_health_
draw_rectangle_color(hp_x, hp_y, hp_x + (hp_width * hp_percentage), hp_y + hp_height,c_olive, c_olive, c_olive, c_olive, false);
draw_line_width_color(hp_x-1, hp_y-1, hp_x + hp_width, hp_y-1, 1, c_black, c_black)
draw_line_width_color(hp_x-1, hp_y + hp_height, hp_x + hp_width, hp_y + hp_height, 1, c_black, c_black)
draw_line_width_color(hp_x-1, hp_y-1, hp_x-1, hp_y + hp_height, 1, c_black, c_black)
draw_line_width_color(hp_x + hp_width, hp_y-1, hp_x + hp_width, hp_y + hp_height, 1, c_black, c_black)


if obj_player.ammo = 0
{
text_color = c_green
}

if !instance_exists(obj_player) exit;
var text = "Ammo: " + string(obj_player.ammo) + " / " + string(obj_player.max_ammo)
var text_width = string_width(text)
var text_height = string_height(text)
var start_x = 8
var start_y = 30
var padding_x = 4
var padding_y = 4
draw_rectangle_color(start_x, start_y, start_x + text_width + padding_y, start_y + text_height + padding_y,  c_olive, c_olive, c_olive, c_olive, false)
draw_text(start_x + padding_x/2, start_y + padding_y, text)
