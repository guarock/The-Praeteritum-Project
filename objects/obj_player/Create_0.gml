hspeed_ = 0
vspeed_ = 0
health_ = 10
max_health_ = health_
gravity_ = 1
jump_height = -16
acceleration_ = 10
#region shooting angles variable
shooting_upwards = false
shooting_downwards = false
#endregion
max_hspeed = 16
current_gun = spr_player_arm_new
current_bullet = obj_bullet 
aiming = 0
ammo = 5
max_ammo = 80
bullet_direction = 0
bullet_cooldown = room_speed/8
alarm[0] = bullet_cooldown
ammo_repeat = true
shooting_cooldown = 360
bullet_for_time = 1