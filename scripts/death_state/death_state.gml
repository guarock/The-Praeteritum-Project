function death_state(death_sprite)
{
set_state_spr(death_sprite, 0.25, 1)
friction = true
if image_index >= image_number - 1
{
	image_index = image_number - 1
	image_speed = 0
	if image_alpha > 0
	{
		image_alpha -= 0.1
	}
	else
	{
	instance_destroy()
	}
}
}