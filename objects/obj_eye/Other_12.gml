/// @description Hit State
sprite_index = spr_eye_hitbox
move_push()
hspeed_push = lerp(hspeed_push, 0, 0.1)
vspeed_push = lerp(vspeed_push, 0, 0.1)

if point_distance(0, 0, hspeed_push, vspeed_push) < 1
{
	sprite_index = spr_eye
	state_ = MOVEMENT
}
