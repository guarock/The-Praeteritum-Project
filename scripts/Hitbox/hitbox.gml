function create_hitbox (x_position, y_position, creator, sprite, lifespan, damage, xscale)
{

var hitbox = instance_create_layer(x_position, y_position, "Instances", obj_hitbox)
hitbox.sprite_index = sprite
hitbox.creator = creator
hitbox.alarm[0] = lifespan
hitbox.damage = damage
hitbox.image_xscale = xscale

}