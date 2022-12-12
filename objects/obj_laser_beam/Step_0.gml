if not instance_exists(obj_drone) exit;
audio_play_sound(shot_sound, 3, false)

x = obj_drone.x
y = obj_drone.y 

direction = point_direction(obj_drone.x, obj_drone.y, mouse_x, mouse_y)

var max_length = 30000
for (i = 0; i < max_length; i++)
{
	xEnd = x + lengthdir_x(i, direction)
	yEnd = y + lengthdir_y(i, direction)
	
	length_laser = i
	
	
	if (collision_point(xEnd, yEnd, obj_wall_in_game, 0, 0)) {
		
		part_particles_create(obj_particle.particle_system, xEnd, yEnd, obj_particle.particle_type_Hit, 1)
		part_particles_create(obj_particle.particle_system, xEnd, yEnd, obj_particle.particle_type_Spark, 10)
		break;
	}
	
		if (collision_point(xEnd, yEnd, obj_eye_laser, 0, 0)) {
		
		part_particles_create(obj_particle.particle_system, xEnd, yEnd, obj_particle.particle_type_Hit, 1)
		part_particles_create(obj_particle.particle_system, xEnd, yEnd, obj_particle.particle_type_Spark, 10)
		break;
	}
}

if instance_exists(obj_eye_laser)
{
var _list = ds_list_create()
var hits = collision_line_list(x, y, xEnd, yEnd, obj_eye_laser, 0, 0, _list, 0)

		if (hits > 0)
		{
			for (var k = 0; k < hits; ++k)
			{
				_list[| k].health_ =  _list[| k].health_ -1
					break;

			}

		}
		ds_list_destroy(_list)
}
if not instance_exists(obj_eye_laser)
{
if instance_exists(obj_door_laser)
{
var _list = ds_list_create()
var hits = collision_line_list(x, y, xEnd, yEnd, obj_door_laser, 0, 0, _list, 0)

		if (hits > 0)
		{
			for (var k = 0; k < hits; ++k)
			{
				_list[| k].health_ =  _list[| k].health_ -1
					break;

			}

		}
		ds_list_destroy(_list)
}
}
if instance_exists(obj_eye_lava)
{
var _list = ds_list_create()
var hits = collision_line_list(x, y, xEnd, yEnd, obj_eye_lava, 0, 0, _list, 0)
	if hits > 0
	{
		for (var k = 0; k < hits; ++k)
		{
			_list[| k].health_ = _list[| k].health_ -1
		}

	}
	ds_list_destroy(_list)
}

if instance_exists(obj_eye_earth)
{
var _list = ds_list_create()
var hits = collision_line_list(x, y, xEnd, yEnd, obj_eye_earth, 0, 0, _list, 0)
	if hits > 0
	{
		for (var k = 0; k < hits; ++k)
		{
			_list[| k].health_ = _list[| k].health_ -1
		}

	}
	ds_list_destroy(_list)
}


if instance_exists(obj_eye_sand)
{
var _list = ds_list_create()
var hits = collision_line_list(x, y, xEnd, yEnd, obj_eye_sand, 0, 0, _list, 0)
	if hits > 0
	{
		for (var k = 0; k < hits; ++k)
		{
			_list[| k].health_ = _list[| k].health_ -1
		}

	}
	ds_list_destroy(_list)
}


if instance_exists(obj_eye_water)
{
var _list = ds_list_create()
var hits = collision_line_list(x, y, xEnd, yEnd, obj_eye_water, 0, 0, _list, 0)
	if hits > 0
	{
		for (var k = 0; k < hits; ++k)
		{
			_list[| k].health_ = _list[| k].health_ -1
		}

	}
	ds_list_destroy(_list)
}