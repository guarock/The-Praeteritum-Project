if state = "move"
{


if player = "1"
{
var dir = point_direction(x, y - 8, mouse_x, mouse_y)
var flipped = 1
if mouse_x < x 
{
flipped = -1
}

draw_sprite_ext(spr_new_player_walk_gun, image_index, x, y, xscale_*flipped, yscale_, 0, image_blend, image_alpha)
draw_sprite_ext(current_gun, 0, x- 2, y, 1, flipped, dir, image_blend, image_alpha)
}
if player = "2"
{
var dir = point_direction(x, y - 8, mouse_x, mouse_y)
var flipped = 1
if mouse_x < x 
{
flipped = -1
}

draw_sprite_ext(spr_new_player_walk, image_index, x, y, xscale_*flipped, yscale_, 0, image_blend, image_alpha)
}
}
else if state = "dash"
{

var dir = point_direction(x, y - 8, mouse_x, mouse_y)
var flipped = 1
if mouse_x < x 
{
flipped = -1
}
if player = "2"
{
draw_sprite_ext(spr_new_player_dash, image_index, x, y, xscale_*flipped, yscale_, 0, image_blend, image_alpha)
}
if player = "1"
{
draw_sprite_ext(spr_new_player_dash_gun, image_index, x, y, xscale_*flipped, yscale_, 0, image_blend, image_alpha)
draw_sprite_ext(current_gun, 0, x - 2, y, 1, flipped, dir, image_blend, image_alpha)
}
if animation_end()
{
	state = "move"
	dash_limit -= 1
if dash_limit < max_dash_limit 
{
	dash_limit = 0
}
}



}
else if state = "side down"
{


var dir = point_direction(x, y - 8, mouse_x, mouse_y)
var flipped = 1
if mouse_x < x 
{
flipped = -1
}

draw_sprite_ext(spr_new_player_side, image_index, x, y, xscale_*flipped, yscale_, 0, image_blend, image_alpha)
if animation_end()
{
	shield = false
	state = "move"
}

}
else if state = "attack"
{
if player = "2"
{
var dir = point_direction(x, y - 8, mouse_x, mouse_y)
var flipped = 1
if mouse_x < x 
{
flipped = -1
}

draw_sprite_ext(spr_new_player_attack, image_index, x, y, xscale_*flipped, yscale_, 0, image_blend, image_alpha)
if animation_end()
{
	state = "move"
}
}
}
else if state = "attack 2"
{
if player = "2"
{
var dir = point_direction(x, y - 8, mouse_x, mouse_y)
var flipped = 1
if mouse_x < x 
{
flipped = -1
}

draw_sprite_ext(new_player_slash, image_index, x, y, xscale_*flipped, yscale_, 0, image_blend, image_alpha)
if animation_end()
{
	state = "move"
}
}
}
else if state = "attack 3"
{
if player = "2"
{
var dir = point_direction(x, y - 8, mouse_x, mouse_y)
var flipped = 1
if mouse_x < x 
{
flipped = -1
}

draw_sprite_ext(new_player_charge_big_sword, image_index, x, y, xscale_*flipped, yscale_, 0, image_blend, image_alpha)
if animation_end()
{
	state = "move"
}
}
}
else if state = "air attack"
{
if player = "2"
{
var dir = point_direction(x, y - 8, mouse_x, mouse_y)
var flipped = 1
if mouse_x < x 
{
flipped = -1
}

draw_sprite_ext(new_player_air_knife, image_index, x, y, xscale_*flipped, yscale_, 0, image_blend, image_alpha)
if animation_end()
{
	state = "move"
}
}
}
else if state = "sword dash"
{
if player = "2"
{
var dir = point_direction(x, y - 8, mouse_x, mouse_y)
var flipped = 1
if mouse_x < x 
{
flipped = -1
}

draw_sprite_ext(new_player_big_sword_side_move, image_index, x, y, xscale_*flipped, yscale_, 0, image_blend, image_alpha)
if animation_end()
{
	state = "move"
}
}
}
else if state = "big sword smash"
{
if player = "2"
{
var dir = point_direction(x, y - 8, mouse_x, mouse_y)
var flipped = 1
if mouse_x < x 
{
flipped = -1
}

draw_sprite_ext(new_player_down_slash_big_sword, image_index, x, y, xscale_*flipped, yscale_, 0, image_blend, image_alpha)
if animation_end()
{
	state = "move"
}
}
}