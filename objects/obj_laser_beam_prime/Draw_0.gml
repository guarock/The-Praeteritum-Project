if not instance_exists(obj_drone) exit;

for (j = 0; j < length_laser; j++)
{
draw_sprite_ext(spr_laser_beam, 0, x + lengthdir_x(j, direction), y + lengthdir_y(j, direction), 1,1, direction, c_white, 1)
}