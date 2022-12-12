var dir = point_direction(x, y - 8, mouse_x, mouse_y)
var hit = instance_create_layer(x, y, "Instances", obj_bullet_hit_normal)
var bullet = instance_create_layer(x, y, "Instances", obj_bullet_normal)
bullet.direction = dir
bullet.image_angle = dir
hit.image_angle = image_angle
audio_play_sound(firework_explosion, 3, false)