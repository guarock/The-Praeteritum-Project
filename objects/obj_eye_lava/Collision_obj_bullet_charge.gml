health_ -= 10
instance_destroy(other)
audio_play_sound(enemy_hit_by_knife, 3, false)
state_ = HIT
var dir = other.direction
hspeed_push = lengthdir_x(8, dir)
vspeed_push = lengthdir_y(8, dir)
