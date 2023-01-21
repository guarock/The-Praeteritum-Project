#region Player
gold = 0
hspeed_ = 0
vspeed_ = 0
gravity_ = 1
acceleration_ = 2
jump_height = -16
max_hspeed = 12
state = "move"

health_ = 20
particle_x = 4
particle_y = 13
max_health_ = health_ 
dash_limit = 2
max_dash_limit = dash_limit
shield = false
player = "1"
current_enemy = obj_eye
current_power_enemy = obj_eye_powered_up
#endregion
#region Guns
ammo = 40
max_ammo = 40
current_gun = spr_gun
current_bullet = obj_bullet_normal
current_sound = shot_sound
current_cooldown = room_speed/8

sword = false
big_sword = false
#endregion
xscale_ = image_xscale
yscale_ = image_yscale