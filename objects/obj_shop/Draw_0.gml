if !instance_exists(obj_new_player) exit;
draw_self()
if place_meeting(x,y,obj_new_player)
{
var text = "press E to upgrade Health"
var text_width = string_width(text)
var text_height = string_height(text)
var start_x = x - 54
var start_y = y - 10
var padding_x = 4
var padding_y = 4
draw_rectangle_color(start_x, start_y, start_x + text_width + padding_y, start_y + text_height + padding_y,  c_orange, c_orange, c_orange, c_orange, false)
draw_text(start_x + padding_x/2, start_y + padding_y, text)

var text = "press T to upgrade Ammo"
var text_width = string_width(text)
var text_height = string_height(text)
var start_x = x - 50
var start_y = y - 30
var padding_x = 4
var padding_y = 4
draw_rectangle_color(start_x, start_y, start_x + text_width + padding_y, start_y + text_height + padding_y,  c_orange, c_orange, c_orange, c_orange, false)
draw_text(start_x + padding_x/2, start_y + padding_y, text)

var text = "press I to upgrade Speed"
var text_width = string_width(text)
var text_height = string_height(text)
var start_x = x - 51
var start_y = y - 50
var padding_x = 4
var padding_y = 4
draw_rectangle_color(start_x, start_y, start_x + text_width + padding_y, start_y + text_height + padding_y,  c_orange, c_orange, c_orange, c_orange, false)
draw_text(start_x + padding_x/2, start_y + padding_y, text)
}