// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tile_collision(tiles_)
{
	//right collision
if tilemap_get_at_pixel(tiles_, bbox_right + hspeed_, y) != 0
{
x = round(x)
	while tilemap_get_at_pixel(tiles_, bbox_right, y) == 0
	{
	x += 1
	}
	
	while tilemap_get_at_pixel(tiles_, bbox_right, y) != 0
	{
	x -= 1
	}

}
hspeed_ = 0

	//left collision
if tilemap_get_at_pixel(tiles_, bbox_left + hspeed_, y) != 0
{
x = round(x)
	while tilemap_get_at_pixel(tiles_, bbox_right, y) == 0
	{
	x -= 1
	}
	
	while tilemap_get_at_pixel(tiles_, bbox_right, y) != 0
	{
	x += 1
	}

}
hspeed_ = 0

if tilemap_get_at_pixel(tiles_, bbox_bottom, y) == 0
{
	vspeed_ += gravity_
	image_speed = 0
	image_index = 5
} else if keyboard_check_pressed(vk_up)
{
	vspeed_ = jump_height
	xscale_ = image_xscale * 0.8
	yscale_ = image_yscale * 1.4
}
}