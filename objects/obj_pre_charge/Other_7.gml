var dir = point_direction(x, y - 8, mouse_x, mouse_y)
var bullet = instance_create_layer(x, y, "Instances", obj_bullet_charge)
audio_play_sound(shatter_shot, 2, false)
bullet.direction = dir
bullet.image_angle = dir
instance_destroy()