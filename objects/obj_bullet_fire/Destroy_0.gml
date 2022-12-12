var hit = instance_create_layer(x, y, "Instances", obj_bullet_hit_fire)
hit.image_angle = image_angle
audio_play_sound(hit_bullet, 3, false)