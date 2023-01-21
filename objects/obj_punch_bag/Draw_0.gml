draw_self()
if place_meeting(x,y, obj_hitbox)
{
if !instance_exists(obj_new_player) exit;


var text = string(obj_hitbox.damage)
var start_x = x - 8
var start_y = y - 50
var padding_x = 4
var padding_y = 4

draw_text(start_x + padding_x/2, start_y + padding_y, text)

}
