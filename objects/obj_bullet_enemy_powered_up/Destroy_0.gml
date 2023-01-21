var hit = instance_create_layer(x, y, "Instances", obj_bullet_hit_enemy_powered_up)
var dir = point_direction(x, y, obj_new_player.x, obj_new_player.y- obj_new_player.sprite_height/2)
var bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy_chained);
bullet.direction = dir
bullet.image_angle = dir
hit.image_angle = image_angle