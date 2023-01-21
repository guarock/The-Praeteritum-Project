var bullet = instance_create_layer(x, y, "Instances", obj_bullet_bow)
audio_play_sound(shatter_shot, 2, false)
bullet.direction = direction
bullet.image_angle = image_angle
instance_destroy()