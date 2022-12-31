switch (state)
{
case "move":
#region Movement
#region pre-movement
if ammo < 0
{
	ammo = 0
}
if health_ <= 0
{
	var near = instance_nearest(x,y, obj_save_point)
if instance_exists(obj_save_point)
{
health_ = max_health_
x = near.x
y = near.y
} else 
{
	instance_destroy()
}

}
if health_ > max_health_
{
health_ -= 1
}
#endregion
#region movement action
show_debug_message("sei nel movement_action ")
var hinput = keyboard_check(vk_right) - keyboard_check(vk_left)
if hinput != 0
{
	show_debug_message(" l'imput non è uguale a 0")
	
	//part_particles_create(obj_particle.particle_system, x - particle_x, y  - particle_y, obj_particle.particle_type_player_spark, 5)
	//part_particles_create(obj_particle.particle_system, x + particle_x , y - particle_y, obj_particle.particle_type_player_spark, 5)
	
	hspeed_ += hinput*acceleration_
	show_debug_message("la velocità orizzontale è uguale all'imput per l'accelerazione")
	hspeed_ = clamp(hspeed_, -max_hspeed, max_hspeed)
	show_debug_message("raggiungi la massima velocità")
	var flipped = (mouse_x > x) * 2 - 1
	image_speed = flipped * hinput * 0.6
		show_debug_message("correggi lo sprite in base a dove si trova il mouse")
}
else
{
	show_debug_message("non hai imput")
	hspeed_ = lerp(hspeed_, 0, 0.5)
	show_debug_message("rallenti fino a 0")
	image_speed = 0
	image_index = 0
	show_debug_message("setti la velocità e l'index dell'immagine")
}
	show_debug_message("entri nello script move")
move(hspeed_, vspeed_)

if !place_meeting(x, y+1, obj_wall_in_game)
{
	show_debug_message("non stai toccando il suolo")
		if hinput = 0
	{
	//part_particles_create(obj_particle.particle_system, x - particle_x, y - particle_y, obj_particle.particle_type_player_spark, 5)
	//part_particles_create(obj_particle.particle_system, x + particle_x, y - particle_y, obj_particle.particle_type_player_spark, 5)
	}
	vspeed_ += gravity_
	show_debug_message("alla velocità verticale viene sommata la gravità")
	image_speed = 0
	image_index = 5
	show_debug_message("setti la velocità e l'index dell'immagine")
} else if keyboard_check_pressed(vk_up)
{
	show_debug_message("stai toccando il terreno e premi salto")
		if hinput = 0
	{
	//part_particles_create(obj_particle.particle_system, x - 2, y  - 13, obj_particle.particle_type_player_spark, 5)
	//part_particles_create(obj_particle.particle_system, x + 2 , y - 13, obj_particle.particle_type_player_spark, 5)
	}
	vspeed_ = jump_height
	show_debug_message("la velocità verticale è uguale all'altezza del salto")
	xscale_ = image_xscale * 0.8
	yscale_ = image_yscale * 1.4
		show_debug_message("setti scala dell'immagine")
}
#endregion
//check for landing
if place_meeting(x, y + 1, obj_wall_in_game) && !place_meeting(x, yprevious + 1, obj_wall_in_game)
{
		show_debug_message("stai per toccare il suolo")
		audio_play_sound(jump, 2, false)
			show_debug_message("parte il suono")
	xscale_ = image_xscale * 1.4
	yscale_ = image_yscale * 0.8
		show_debug_message("setti la scala dell'immagine")
}

// m0ve back to normale scale
xscale_ = lerp(xscale_, image_xscale, 0.1)
yscale_ = lerp(yscale_, image_yscale, 0.1)
	show_debug_message("riporti la scala delle x e delle y in modo normale")

if mouse_check_button_pressed(mb_right) && not place_meeting(x, y + 1, obj_wall_in_game) && dash_limit > 0
{
		show_debug_message("fai partire il dash")
	state = "dash"
}

	
if mouse_check_button_pressed(mb_right) && place_meeting(x, y+1, obj_wall_in_game)
{
		show_debug_message("fai partire il dash da terra")
state = "side down"
}

if place_meeting(x,y+1,obj_wall_in_game)
{
	show_debug_message("ricarichi il dash")
	dash_limit = max_dash_limit
}

if health_ <= 0
{
	room_goto(rm_base)
	health_ = max_health_
}

room_warp()
#endregion
if player = "1"
{
#region Guns
if mouse_check_button(mb_left) && current_gun != spr_charger && current_gun != spr_firework_launcher && current_gun != spr_rocket_launcher && current_gun != spr_pump_animation && current_gun != spr_revolver && current_gun != spr_narga_gun && current_gun != spr_gun_long_shot
{
if ammo > 0
{
if alarm[0] <= 0
{ 
	ammo -= 1
	var dir = point_direction(x, y - 8, mouse_x, mouse_y)
	var flipped = (mouse_x > x) * 2 - 1
	var gun_x = x - 4 * flipped
	var x_offset = lengthdir_x(20, dir)
	var y_offset = lengthdir_y(20, dir)
	var bullet = instance_create_layer(gun_x + x_offset, y + y_offset, "Instances", current_bullet);
	audio_play_sound(current_sound, 2, false)
	bullet.direction = dir
	bullet.image_angle = dir
	alarm[0] = bullet_cooldown
}
} else if ammo <= 0
{
audio_play_sound(handgun_click, 3, false)
}
}
#endregion
#region Revolver
if mouse_check_button_pressed(mb_left) && current_gun != spr_charger && current_gun != spr_firework_launcher && current_gun != spr_rocket_launcher && current_gun != spr_pump_animation && current_gun = spr_revolver && current_gun != spr_narga_gun && current_gun != spr_gun_long_shot
{
if ammo > 0
{
if alarm[0] <= 0
{ 
	ammo -= 1
	var dir = point_direction(x, y - 8, mouse_x, mouse_y)
	var flipped = (mouse_x > x) * 2 - 1
	var gun_x = x - 4 * flipped
	var x_offset = lengthdir_x(7, dir)
	var y_offset = lengthdir_y(7, dir)
	var bullet = instance_create_layer(gun_x + x_offset, y - 8 + y_offset, "Instances", current_bullet);
	audio_play_sound(mixkit_game_gun_shot_1662, 2, false)
	bullet.direction = dir
	bullet.image_angle = dir
	alarm[0] = bullet_cooldown
}
} else if ammo <= 0
{
audio_play_sound(handgun_click, 3, false)
}
}
#endregion
#region Nargun
if mouse_check_button_pressed(mb_left) && current_gun != spr_charger && current_gun != spr_firework_launcher && current_gun != spr_rocket_launcher && current_gun != spr_pump  && current_gun != spr_revolver && current_gun = spr_narga_gun && current_gun != spr_gun_long_shot
{
if ammo > 0
{
if alarm[0] <= 0
{ 
	ammo -= 1
	var dir = point_direction(x, y - 8, mouse_x, mouse_y)
	var flipped = (mouse_x > x) * 2 - 1
	var gun_x = x - 4 * flipped
	var x_offset = lengthdir_x(20, dir)
	var y_offset = lengthdir_y(20, dir)
	var bullet = instance_create_layer(gun_x + x_offset, y - 8 + y_offset, "Instances", current_bullet);
	audio_play_sound(narga_shot, 2, false)
	bullet.direction = dir
	bullet.image_angle = dir
	alarm[0] = bullet_cooldown
}
} else if ammo <= 0
{
audio_play_sound(handgun_click, 3, false)
}
}
#endregion
#region Long Shot
if mouse_check_button_pressed(mb_left) && current_gun != spr_charger && current_gun != spr_firework_launcher && current_gun != spr_rocket_launcher && current_gun != spr_pump_animation  && current_gun != spr_revolver && current_gun != spr_narga_gun && current_gun = spr_gun_long_shot
{
if ammo > 0
{
if alarm[0] <= 0
{ 
	ammo -= 1
	var dir = point_direction(x, y - 8, mouse_x, mouse_y)
	var flipped = (mouse_x > x) * 2 - 1
	var gun_x = x - 4 * flipped
	var x_offset = lengthdir_x(20, dir)
	var y_offset = lengthdir_y(20, dir)
	var bullet = instance_create_layer(gun_x + x_offset, y - 8 + y_offset, "Instances", current_bullet);
	audio_play_sound(mixkit_game_gun_shot_1662, 2, false)
	bullet.direction = dir
	bullet.image_angle = dir
	alarm[0] = bullet_cooldown
}
} else if ammo <= 0
{
audio_play_sound(handgun_click, 3, false)
}
}
#endregion
#region Pump
if mouse_check_button_pressed(mb_left) && current_gun != spr_charger  && current_gun != spr_firework_launcher && current_gun != spr_rocket_launcher && current_gun = spr_pump_animation && current_gun != spr_revolver && current_gun != spr_narga_gun && current_gun != spr_gun_long_shot
{
if ammo > 0
{
if alarm[0] <= 0
{ 
	ammo -= 1
	var dir = point_direction(x, y - 8, mouse_x, mouse_y)
	var flipped = (mouse_x > x) * 2 - 1
	var gun_x = x - 4 * flipped
	var x_offset = lengthdir_x(20, dir)
	var y_offset = lengthdir_y(20, dir)
	var bullet = instance_create_layer(gun_x + x_offset, y - 8 + y_offset, "Instances", current_bullet);
	audio_play_sound(mixkit_game_gun_shot_1662, 2, false)
	bullet.direction = dir
	bullet.image_angle = dir
	alarm[0] = bullet_cooldown
	audio_play_sound(pump, 3, false)
	
}
} else if ammo <= 0
{
audio_play_sound(handgun_click, 3, false)
}
}
#endregion
#region Rocket
if mouse_check_button_pressed(mb_left) && current_gun != spr_charger  && current_gun != spr_firework_launcher && current_gun = spr_rocket_launcher && current_gun != spr_pump_animation && current_gun != spr_revolver && current_gun != spr_narga_gun && current_gun != spr_gun_long_shot
{
if ammo > 0
{
if alarm[0] <= 0
{ 
	ammo -= 1
	var dir = point_direction(x, y - 8, mouse_x, mouse_y)
	var flipped = (mouse_x > x) * 2 - 1
	var gun_x = x - 4 * flipped
	var x_offset = lengthdir_x(20, dir)
	var y_offset = lengthdir_y(20, dir)
	var bullet = instance_create_layer(gun_x + x_offset, y - 8 + y_offset, "Instances", current_bullet);
	audio_play_sound(mixkit_game_gun_shot_1662, 2, false)
	bullet.direction = dir
	bullet.image_angle = dir
	alarm[0] = bullet_cooldown
	audio_play_sound(pump, 3, false)
	
}
} else if ammo <= 0
{
audio_play_sound(handgun_click, 3, false)
}
}
#endregion
#region Fireworks
if mouse_check_button_pressed(mb_left) && current_gun != spr_charger && current_gun = spr_firework_launcher && current_gun != spr_rocket_launcher && current_gun != spr_pump_animation && current_gun != spr_revolver && current_gun != spr_narga_gun && current_gun != spr_gun_long_shot
{
if ammo > 0
{
if alarm[0] <= 0
{ 
	ammo -= 3
	var dir = point_direction(x, y - 8, mouse_x, mouse_y)
	var flipped = (mouse_x > x) * 2 - 1
	var gun_x = x - 4 * flipped
	var x_offset = lengthdir_x(20, dir)
	var y_offset = lengthdir_y(20, dir)
	var bullet = instance_create_layer(gun_x + x_offset, y - 1 + y_offset, "Instances", current_bullet);
	var bullet_1 = instance_create_layer(gun_x + x_offset, y - 8 + y_offset, "Instances", current_bullet);
	var bullet_2 = instance_create_layer(gun_x + x_offset, y - 15 + y_offset, "Instances", current_bullet);
	audio_play_sound(mixkit_game_gun_shot_1662, 2, false)
	bullet.direction = dir
	bullet.image_angle = dir
		bullet_1.direction = dir
	bullet_1.image_angle = dir
		bullet_2.direction = dir
	bullet_2.image_angle = dir

	alarm[0] = bullet_cooldown
	audio_play_sound(pump, 3, false)
	
}
} else if ammo <= 0
{
audio_play_sound(handgun_click, 3, false)
}
}
#endregion
#region charger
if mouse_check_button_pressed(mb_left) && current_gun = spr_charger  && current_gun != spr_firework_launcher && current_gun != spr_rocket_launcher && current_gun != spr_pump_animation && current_gun != spr_revolver && current_gun != spr_narga_gun && current_gun != spr_gun_long_shot
{
if ammo > 0
{
if alarm[0] <= 0
{ 
	ammo -= 1
	var dir = point_direction(x, y - 8, mouse_x, mouse_y)
	var flipped = (mouse_x > x) * 2 - 1
	var gun_x = x - 4 * flipped
	var x_offset = lengthdir_x(20, dir)
	var y_offset = lengthdir_y(20, dir)
	var bullet = instance_create_layer(gun_x + x_offset, y - 8 + y_offset, "Instances", current_bullet);
	audio_play_sound(shot_sound, 2, false)
	bullet.direction = dir
	bullet.image_angle = dir
	alarm[0] = bullet_cooldown
	audio_play_sound(pump, 3, false)
	
	
}
} else if ammo <= 0
{
audio_play_sound(handgun_click, 3, false)
}
}
#endregion
#region Stats
if current_gun = spr_gun
{
	jump_height = -15
	gravity_ = 0.5
}
else 
{
	gravity_ = 1
	jump_height = -16
}
if current_gun = spr_gun_vacuum
{
	acceleration_ = 6
} else 
{acceleration_ = 2}
if current_gun = spr_gun_long_shot && mouse_check_button(mb_left)
{
	health_ += 1
}
if health_ > max_health_
{
	health_ = max_health_
}
#endregion
}
if player = "2"
{
	
	if mouse_check_button_pressed(mb_left) &&  place_meeting(x, y+1, obj_wall_in_game) && sword = true && big_sword = false
	{
	state = "attack 2"
	}
	
		if mouse_check_button_pressed(mb_left) &&  place_meeting(x, y+1, obj_wall_in_game) && big_sword = true && sword = false
	{
	state = "attack 3"
	}
	
		if mouse_check_button_pressed(mb_left) && not place_meeting(x, y+1, obj_wall_in_game) && sword = true && big_sword = false
	{
	state = "air attack"
	}
	
		if mouse_check_button_pressed(mb_left) && not place_meeting(x, y+1, obj_wall_in_game) && sword = false && big_sword = true
	{
	state = "big sword smash"
	}

}
break;
case "dash":
#region Dash
xscale_ = lerp(xscale_, image_xscale, 0.1)
yscale_ = lerp(yscale_, image_yscale, 0.1)

image_speed = 0.5

	
	//part_particles_create(obj_particle.particle_system, x - particle_x, y  - particle_y, obj_particle.particle_type_player_spark, 5)
	//part_particles_create(obj_particle.particle_system, x + particle_x , y - particle_y, obj_particle.particle_type_player_spark, 5)
	
if mouse_x >= x and not place_meeting(x+7, y+1, obj_wall_in_game) 
{
x += 7
}
if mouse_x < x and not place_meeting(x-7, y+1, obj_wall_in_game) 
{
x -= 7
}
if not place_meeting(x,y-2,obj_wall_in_game)
{
	y -= 2
}


#endregion
break;
case "side down":
#region Side Down
xscale_ = lerp(xscale_, image_xscale, 0.1)
yscale_ = lerp(yscale_, image_yscale, 0.1)
shield = true
image_speed = 0.5
if mouse_x >= x and not place_meeting(x+5, y, obj_wall_in_game) 
{
x += 5
}
if mouse_x < x and not place_meeting(x-5, y, obj_wall_in_game) 
{
x -= 5
}


#endregion
break;
case "attack":
#region Attack
xscale_ = lerp(xscale_, image_xscale, 0.1)
yscale_ = lerp(yscale_, image_yscale, 0.1)
image_speed = 1
if animation_hit_frame(1)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, spr_new_player_attack, 1, 1, xscale_)
}
if animation_hit_frame(2)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, spr_new_player_attack, 1, 1, xscale_)
}
if animation_hit_frame(3)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, spr_new_player_attack, 1, 1, xscale_)
}
if animation_hit_frame(4)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, spr_new_player_attack, 1, 1, xscale_)
}
if animation_hit_frame(5)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, spr_new_player_attack, 1, 1, xscale_)
}
if animation_hit_frame(6)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, spr_new_player_attack, 1, 1, xscale_)
}
if animation_hit_frame(7)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, spr_new_player_attack, 1, 1, xscale_)
}
if animation_hit_frame(8)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, spr_new_player_attack, 1, 1, xscale_)
}
if animation_hit_frame(9)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, spr_new_player_attack, 1, 1, xscale_)
}
if animation_hit_frame(10)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, spr_new_player_attack, 1, 1, xscale_)
}
#endregion
break;
case "attack 2":
#region Attack
xscale_ = lerp(xscale_, image_xscale, 0.1)
yscale_ = lerp(yscale_, image_yscale, 0.1)
image_speed = 1
if animation_hit_frame(1)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_slash_hitbox, 1, 1, xscale_)
}
if animation_hit_frame(2)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_slash_hitbox, 1, 2, xscale_)
}
if animation_hit_frame(3)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_slash_hitbox, 1, 2, xscale_)
}
if animation_hit_frame(4)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_slash_hitbox, 1, 2, xscale_)
}
if animation_hit_frame(5)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_slash_hitbox, 1, 4, xscale_)
}
if animation_hit_frame(6)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_slash_hitbox, 1, 6, xscale_)
}
if animation_hit_frame(7)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_slash_hitbox, 1, 6, xscale_)
}
if animation_hit_frame(8)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_slash_hitbox, 1, 6, xscale_)
}
if animation_hit_frame(9)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_slash_hitbox, 1, 1, xscale_)
}
if animation_hit_frame(10)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_slash_hitbox, 1, 1, xscale_)
}
if animation_hit_frame(11)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_slash_hitbox, 1, 1, xscale_)
}
if animation_hit_frame(12)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_slash_hitbox, 1, 1, xscale_)
}
#endregion
break;
case "attack 3":
#region Attack
xscale_ = lerp(xscale_, image_xscale, 0.1)
yscale_ = lerp(yscale_, image_yscale, 0.1)
image_speed = 1
//if animation_hit_frame(1)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 2, xscale_)
//}
//if animation_hit_frame(2)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 2, xscale_)
//}
//if animation_hit_frame(3)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 2, xscale_)
//}
//if animation_hit_frame(4)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 2, xscale_)
//}
//if animation_hit_frame(5)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 2, xscale_)
//}
//if animation_hit_frame(6)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 2, xscale_)
//}
//if animation_hit_frame(7)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 4, xscale_)
//}
//if animation_hit_frame(8)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 4, xscale_)
//}
//if animation_hit_frame(9)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 4, xscale_)
//}
if animation_hit_frame(10)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 6, xscale_)
}
if animation_hit_frame(11)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 6, xscale_)
}
if animation_hit_frame(12)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 10, xscale_)
}
if animation_hit_frame(13)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 10, xscale_)
}
//if animation_hit_frame(14)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 1, xscale_)
//}
//if animation_hit_frame(15)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_charge_big_sword_hitbox, 1, 1, xscale_)
//}

#endregion
break;
case "air attack":
#region Air Attack
xscale_ = lerp(xscale_, image_xscale, 0.1)
yscale_ = lerp(yscale_, image_yscale, 0.1)
image_speed = 1

	if player = "2"
	{
	part_particles_create(obj_particle.particle_system, x - particle_x, y  - particle_y, obj_particle.particle_type_player_spark, 5)
	part_particles_create(obj_particle.particle_system, x + particle_x , y - particle_y, obj_particle.particle_type_player_spark, 5)
	}
if animation_hit_frame(1)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}
if animation_hit_frame(2)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}
if animation_hit_frame(3)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}
if animation_hit_frame(4)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}
if animation_hit_frame(5)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}
if animation_hit_frame(6)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}
if animation_hit_frame(7)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}
if animation_hit_frame(8)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}if animation_hit_frame(9)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}
if animation_hit_frame(10)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}
if animation_hit_frame(11)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}
if animation_hit_frame(12)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}
if animation_hit_frame(13)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}
if animation_hit_frame(14)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}
if animation_hit_frame(15)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_air_knife, 1, 2, xscale_)
}
#endregion
case "sword dash":
#region Sword Dash
xscale_ = lerp(xscale_, image_xscale, 0.1)
yscale_ = lerp(yscale_, image_yscale, 0.1)
image_speed = 1
if mouse_x >= x and not place_meeting(x+7, y, obj_wall_in_game) 
{
x += 7
}
if mouse_x < x and not place_meeting(x-7, y, obj_wall_in_game) 
{
x -= 7
}

//if animation_hit_frame(1)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_big_sword_side_move, 1, 2, xscale_)
//}
//if animation_hit_frame(2)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_big_sword_side_move, 1, 2, xscale_)
//}
//if animation_hit_frame(3)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_big_sword_side_move, 1, 2, xscale_)
//}
//if animation_hit_frame(4)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_big_sword_side_move, 1, 2, xscale_)
//}
//if animation_hit_frame(5)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_big_sword_side_move, 1, 2, xscale_)
//}
//if animation_hit_frame(6)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_big_sword_side_move, 1, 2, xscale_)
//}
//if animation_hit_frame(7)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_big_sword_side_move, 1, 2, xscale_)
//}
//if animation_hit_frame(8)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_big_sword_side_move, 1, 2, xscale_)
//}if animation_hit_frame(9)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_big_sword_side_move, 1, 2, xscale_)
//}
//if animation_hit_frame(10)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_big_sword_side_move, 1, 2, xscale_)
//}
//if animation_hit_frame(11)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_big_sword_side_move, 1, 4, xscale_)
//}
//if animation_hit_frame(12)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_big_sword_side_move, 1, 4, xscale_)
//}
//if animation_hit_frame(13)
//{
//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_big_sword_side_move, 1, 4, xscale_)
//}
//if animation_hit_frame(14)
//{

//	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_big_sword_side_move, 1, 4, xscale_)
//}
//if !place_meeting(x, y+1, obj_wall_in_game)
//{
//	vspeed_ += gravity_
//}
#endregion
break;
case "big sword smash":
#region Sword Smash
xscale_ = lerp(xscale_, image_xscale, 0.1)
yscale_ = lerp(yscale_, image_yscale, 0.1)
image_speed = 1

	if player = "2"
	{
	part_particles_create(obj_particle.particle_system, x - particle_x, y  - particle_y, obj_particle.particle_type_player_spark, 5)
	part_particles_create(obj_particle.particle_system, x + particle_x , y - particle_y, obj_particle.particle_type_player_spark, 5)
	}
if animation_hit_frame(1)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 2, xscale_)
}
if animation_hit_frame(2)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 2, xscale_)
}
if animation_hit_frame(3)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 2, xscale_)
}
if animation_hit_frame(4)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 2, xscale_)
}
if animation_hit_frame(5)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 2, xscale_)
}
if animation_hit_frame(6)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 2, xscale_)
}
if animation_hit_frame(7)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 4, xscale_)
}
if animation_hit_frame(8)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 4, xscale_)
}
if animation_hit_frame(9)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 4, xscale_)
}
if animation_hit_frame(10)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 6, xscale_)
}
if animation_hit_frame(11)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 6, xscale_)
}
if animation_hit_frame(12)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 10, xscale_)
}
if animation_hit_frame(13)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 10, xscale_)
}
if animation_hit_frame(14)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 1, xscale_)
}
if animation_hit_frame(15)
{
	create_hitbox(obj_new_player.x, obj_new_player.y, obj_new_player, new_player_down_slash_big_sword, 1, 1, xscale_)
}

if not place_meeting(x,y+5,obj_wall_in_game)
{
	y += 5
}

#endregion
break;
}