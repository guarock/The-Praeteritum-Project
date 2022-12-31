#region Movement


if animation_end()
{

			part_particles_create(obj_particle.particle_system, x, y, obj_particle.particle_type_Hit, 1)
		part_particles_create(obj_particle.particle_system, x, y, obj_particle.particle_type_Spark, 20)

	//instance_create_layer( x, y, "Instances", obj_new_player)
	//instance_destroy()
	max_hspeed = 12
max_vspeed = 12
}



if health_ <= 0
{
	game_restart()
	instance_destroy()
}
if health_ > max_health_
{
health_ -= 1
}

var hinput = keyboard_check(vk_right) - keyboard_check(vk_left)
var vinput = keyboard_check(vk_down) - keyboard_check(vk_up)
if hinput != 0
{
	part_particles_create(obj_particle.particle_system, x, y, obj_particle.particle_type_Hit, 2)
	part_particles_create(obj_particle.particle_system, x, y, obj_particle.particle_type_Spark, 5)
	hspeed_ += hinput*acceleration_
	hspeed_ = clamp(hspeed_, -max_hspeed, max_hspeed)
	var flipped = (mouse_x > x) * 2 - 1
}
else
{
	hspeed_ = lerp(hspeed_, 0, 0.5)
	image_index = 0
}
if vinput != 0
{
	
	part_particles_create(obj_particle.particle_system, x, y, obj_particle.particle_type_Hit, 2)
	part_particles_create(obj_particle.particle_system, x, y, obj_particle.particle_type_Spark, 5)
	vspeed_ += vinput*acceleration_
	vspeed_ = clamp(vspeed_, -max_vspeed, max_vspeed)
	var flipped = (mouse_x > x) * 2 - 1
}
else
{
	vspeed_ = lerp(vspeed_, 0, 0.5)
	image_index = 0
}
move(hspeed_,vspeed_)
if mouse_check_button(mb_left) 
//and !mouse_check_button_pressed(mb_right)
{
	if !(instance_exists(obj_laser_beam))
	{
		instance_create_layer(mouse_x, mouse_y, "Instances", obj_laser_beam)	
		}
}
else if !mouse_check_button(mb_left)
{
instance_destroy(obj_laser_beam)
}

//if mouse_check_button(mb_right) and !mouse_check_button(mb_left)
//{
//	if !(instance_exists(obj_laser_beam_prime))
//	{
//		instance_create_layer(mouse_x, mouse_y, "Instances", obj_laser_beam_prime)	
//		}
//}
//else if !mouse_check_button(mb_right)
//{
//instance_destroy(obj_laser_beam_prime)
//}
//room_warp()
#endregion
