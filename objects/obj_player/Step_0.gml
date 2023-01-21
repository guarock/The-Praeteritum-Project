<<<<<<< HEAD

#region movement
#region horizontal movent
var hinput = keyboard_check(vk_right) - keyboard_check(vk_left)
hspeed_ = hinput*acceleration_
if hinput != 0
{

	sprite_index = spr_legs_arm
	image_xscale = hinput
=======
if instance_exists(obj_controller)
{
if global.game_state = states.paused 
{
	exit
}
}
#region movement
#region horizontal movent
var hinput = keyboard_check(vk_right) - keyboard_check(vk_left)
var dir = point_direction(x, y - 8, mouse_x, mouse_y)
hspeed_ = hinput*acceleration_
if hinput != 0
{
	if aiming = dir
	{
	sprite_index = spr_new_legs
	}else
	{
	sprite_index = spr_legs_arm
	}
image_xscale = hinput
>>>>>>> 58bf88405230b78262ffcdddbfc1d6c172406aa8
	image_speed = 1
}
else 
{
<<<<<<< HEAD
	sprite_index = spr_idle
	image_speed = 1
	image_index = 0
	if keyboard_check(vk_up)
	{
		shooting_upwards = true
		sprite_index = spr_idle_upshooting
		image_speed = 1
		image_index = 0
	}
	else
	{
		shooting_upwards = false
		sprite_index = spr_idle
	}
=======
	if aiming = dir
	{
	sprite_index = spr_new_legs_idle
	}else
	{
	sprite_index = spr_idle
	}
	image_speed = 0
	image_index = 0
>>>>>>> 58bf88405230b78262ffcdddbfc1d6c172406aa8
}
#endregion
#region vertical movement
if !place_meeting(x, y+1, obj_wall_in_game)
{
<<<<<<< HEAD
	vspeed_ += gravity_   
	sprite_index = spr_new_jump
	image_speed = 1
	if shooting_upwards = true
	{
	sprite_index = spr_jump_up
		image_speed = 1
	}
	else
	{
		sprite_index = spr_new_jump
}
}
=======
	vspeed_ += gravity_
	sprite_index = spr_jump
	image_speed = 1
} 
>>>>>>> 58bf88405230b78262ffcdddbfc1d6c172406aa8
else if place_meeting(x, y+1, obj_wall_in_game) && keyboard_check_pressed(vk_space)
{
	vspeed_ = jump_height
	audio_play_sound(jump_sound, 3, false)
<<<<<<< HEAD
		sprite_index = spr_new_jump
=======
		sprite_index = spr_jump
>>>>>>> 58bf88405230b78262ffcdddbfc1d6c172406aa8
		image_speed = 1
}
move(hspeed_, vspeed_)
#endregion
<<<<<<< HEAD
#region shooting downwards
if keyboard_check(vk_down) && !place_meeting(x, y+1, obj_wall_in_game) 
 {
	shooting_downwards = true
	sprite_index = spr_jump_gun
	image_speed = 1
	image_index = 0
	} else 
	{
	shooting_downwards = false
		image_speed = 1
	}
=======
#endregion
#region aiming 
var dir = point_direction(x, y - 8, mouse_x, mouse_y)
var flipped = 1
if mouse_x < x 
{
flipped = -1
}

if mouse_check_button(mb_left)
{
aiming = dir
} else 
{
aiming = 0
}
#region scale
if aiming = dir 
{
	if current_gun = spr_player_arm
	{
		current_gun = spr_player_arm_free_aiming
	}
	free_shot_x = 1
	free_shot_y = flipped
} 
else if aiming = 0
{
		if current_gun = spr_player_arm_free_aiming
	{
		current_gun = spr_player_arm
	}
	free_shot_x = image_xscale
	free_shot_y = 1
}
>>>>>>> 58bf88405230b78262ffcdddbfc1d6c172406aa8
#endregion
#endregion
#region shooting
#region input sistem
pressed_ = mouse_check_button_pressed(mb_left)
hold_ = mouse_check_button(mb_left)
var input_type_ = pressed_
//gun change
if current_gun = spr_player_purple_gun
{
	input_type_ = pressed_
	bullet_for_time = 5
	current_bullet = obj_bullet_long_shot
	shooting_cooldown = 360
} else if current_gun = spr_player_bow
{
		input_type_ = pressed_
	bullet_for_time = 5
	current_bullet = obj_bow_charge
	shooting_cooldown = 360
} else if current_gun = spr_expanded_pistol
{
		input_type_ = pressed_
	bullet_for_time = 10
	current_bullet = obj_bullet_revolver
	shooting_cooldown = 120
}
else if current_gun = spr_player_arm_new
{
		input_type_ = hold_
	bullet_for_time = 2
	current_bullet = obj_bullet
	shooting_cooldown = 60
}
#endregion
if input_type_ && ammo_repeat = true
{
if ammo > 0
{
if alarm[0] <= 0
{	
<<<<<<< HEAD
	 if aiming = 0
	{
	
	ammo -= 1
	var delta_x = 6 * image_xscale
	var bullet = instance_create_layer(x + delta_x, y - 6, "Effects", current_bullet);
	var smoke = instance_create_layer(x + delta_x, y - 6, "Effects", obj_push_smoke);	
	audio_play_sound(shot_sound, 2, false)  
	#region angles and directions
	if image_xscale = 1 or image_xscale = 0 
	{
		bullet_direction = 0
	}
	else if image_xscale = -1 
	{
		bullet_direction = 180
	}
	if shooting_downwards = true 
	{
		bullet_direction = 270
	}
	if shooting_upwards = true
	{
		bullet_direction = 90
	}
	#endregion
		#region gun shooting
		if !place_meeting(x, y+1, obj_wall_in_game) && shooting_downwards = true
	{
	vspeed_ = -10
	} 
	#endregion
=======
	// free aim shooting
	if aiming = dir
	{
		ammo -= 1
	var dir = point_direction(x, y - 8, mouse_x, mouse_y)
	var flipped = (mouse_x > x) * 2 - 1
	var gun_x = x - 4 * flipped
	var x_offset = lengthdir_x(14, dir)
	var y_offset = lengthdir_y(8, dir)
	var bullet = instance_create_layer(gun_x + x_offset, y + y_offset - 4, "Effects", current_bullet);
	var smoke = instance_create_layer(gun_x + x_offset, y + y_offset - 4, "Effects", obj_push_smoke);
	audio_play_sound(shot_sound, 2, false)
	bullet.direction = dir
	bullet.image_angle = dir
	smoke.direction = dir
	smoke.image_angle = dir
	if !place_meeting(x, y+1, obj_wall_in_game) && mouse_y > y
	{
	vspeed_ = -10
	} 
	alarm[0] = bullet_cooldown
	} // normal shooting
	
	else if aiming = 0
	{
	#region bullet direction
	if image_xscale >= 0
	{
		bullet_direction = 0
	} else if image_xscale < 0
	{
		bullet_direction = 180
	}
	#endregion
	ammo -= 1
	var flipped = (mouse_x > x) * 2 - 1
	var gun_x = x - 4 * flipped
	var x_offset = lengthdir_x(14, dir)
	var y_offset = lengthdir_y(2, dir)
	var bullet = instance_create_layer(gun_x + x_offset, y - 4, "Effects", current_bullet);
	var smoke = instance_create_layer(gun_x + x_offset, y + y_offset - 4, "Effects", obj_push_smoke);
	audio_play_sound(shot_sound, 2, false)
>>>>>>> 58bf88405230b78262ffcdddbfc1d6c172406aa8
	bullet.direction = bullet_direction
	bullet.image_angle = bullet_direction
	smoke.direction = bullet_direction
	smoke.image_angle = bullet_direction
	alarm[0] = bullet_cooldown
	}	
} else if ammo <= 0
{

}
}
}
#endregion
#region ammo and ammo variables
if max_ammo > 0
{
if ammo = 0 and ammo_repeat = true
{
alarm[1] = shooting_cooldown
ammo_repeat = false
}
}
switch(current_gun)
{
case spr_player_bow:
#region alarms
	if alarm[1] = 300
	{
	max_ammo -= 1
	audio_play_sound(handgun_click, 3, false)
	}
	if alarm[1] = 240
	{
	max_ammo -= 1
	audio_play_sound(handgun_click, 3, false)
	}
	if alarm[1] = 180
	{
	max_ammo -= 1
	audio_play_sound(handgun_click, 3, false)
	}
	if alarm[1] = 120
	{
	max_ammo -= 1
	audio_play_sound(handgun_click, 3, false)
	}
	if alarm[1] = 60
	{
	max_ammo -= 1
	ammo += bullet_for_time
	ammo_repeat = true
	audio_play_sound(handgun_click, 3, false)
	#endregion
	}
break;
case spr_player_purple_gun:
#region alarms
	if alarm[1] = 300
	{
	max_ammo -= 1
	audio_play_sound(handgun_click, 3, false)
	}
	if alarm[1] = 240
	{
	max_ammo -= 1
	audio_play_sound(handgun_click, 3, false)
	}
	if alarm[1] = 180
	{
	max_ammo -= 1
	audio_play_sound(handgun_click, 3, false)
	}
	if alarm[1] = 120
	{
	max_ammo -= 1
	audio_play_sound(handgun_click, 3, false)
	}
	if alarm[1] = 60
	{
	max_ammo -= 1
	ammo += bullet_for_time
	ammo_repeat = true
	audio_play_sound(handgun_click, 3, false)
	#endregion
	}
break;

case spr_player_arm_new:
	if alarm[1] = 30
	{
	max_ammo -= bullet_for_time
	audio_play_sound(handgun_click, 3, false)
	}
	if alarm[1] = 0
{
	ammo += bullet_for_time
	ammo_repeat = true
}
	break;
	case spr_expanded_pistol:
	#region alarms
	if alarm[1] = 60
	{
	max_ammo -= bullet_for_time/2
		ammo += bullet_for_time/2
	audio_play_sound(handgun_click, 3, false)
	}
		if alarm[1] = 30
	{
	max_ammo -= bullet_for_time/2
		ammo += bullet_for_time/2
	audio_play_sound(handgun_click, 3, false)
	}
	if alarm[1] = 0
{
	ammo_repeat = true
}
#endregion
	break;
}
#endregion
<<<<<<< HEAD
#region damage
if place_meeting(x, y, obj_bullet_enemy_chained)
{
health_ -= 2
}

if place_meeting(x, y, obj_bullet_enemy)
{
health_ -= 1
}
=======
#region recoil

>>>>>>> 58bf88405230b78262ffcdddbfc1d6c172406aa8
#endregion