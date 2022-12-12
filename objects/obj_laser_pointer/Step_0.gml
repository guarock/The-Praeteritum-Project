x = mouse_x
y = mouse_y

if mouse_check_button_pressed(mb_left)
{
image_index = 1
} else if mouse_check_button_released(mb_left)
{
	image_index = 0
}

