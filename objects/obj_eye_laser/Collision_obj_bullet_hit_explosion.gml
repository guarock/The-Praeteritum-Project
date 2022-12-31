health_ -= 6

audio_play_sound(normal_explosion, 3, false)
state_ = HIT
var dir = other.direction
hspeed_push = lengthdir_x(8, dir)
vspeed_push = lengthdir_y(8, dir)
