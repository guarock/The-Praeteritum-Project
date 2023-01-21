//if ammo > 0
//{
//if alarm[0] <= 0
//{ 
//	ammo -= 1
//	var dir = point_direction(player_shooting.x, player_shooting.y - 8, mouse_x, mouse_y)
//	var flipped = (mouse_x > player_shooting.x) * 2 - 1
//	var gun_x = player_shooting.x - 4 * flipped
//	var x_offset = lengthdir_x(20, dir)
//	var y_offset = lengthdir_y(20, dir)
//	var bullet = instance_create_layer(gun_x + x_offset, player_shooting.y - 8 + y_offset, "Instances", current_bullet);
//	audio_play_sound(current_sound, 2, false)
//	bullet.direction = dir
//	bullet.image_angle = dir
//	alarm[0] = bullet_cooldown
//}
//} else if ammo <= 0
//{
//audio_play_sound(handgun_click, 3, false)
//}

