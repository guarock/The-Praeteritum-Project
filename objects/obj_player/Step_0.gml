
#region movement
#region horizontal movent
var hinput = keyboard_check(vk_right) - keyboard_check(vk_left)
hspeed_ = hinput*acceleration_
if hinput != 0
{

	sprite_index = spr_legs_arm
	image_xscale = hinput
	image_speed = 1
}
else 
{
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
}
#endregion
#region vertical movement
if !place_meeting(x, y+1, obj_wall_in_game)
{
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
else if place_meeting(x, y+1, obj_wall_in_game) && keyboard_check_pressed(vk_space)
{
	vspeed_ = jump_height
	audio_play_sound(jump_sound, 3, false)
		sprite_index = spr_new_jump
		image_speed = 1
}
move(hspeed_, vspeed_)
#endregion
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
#region damage
if place_meeting(x, y, obj_bullet_enemy_chained)
{
health_ -= 2
}

if place_meeting(x, y, obj_bullet_enemy)
{
health_ -= 1
}
#endregion