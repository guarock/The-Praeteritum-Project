if  current_enemy = obj_eye
{
current_enemy = obj_eye_lava
} 
else if current_enemy = obj_eye_lava
{
current_enemy = obj_eye_water
}
else if current_enemy = obj_eye_water
{
current_enemy = obj_eye_sand
}
else if current_enemy = obj_eye_sand
{
current_enemy = obj_eye
}

if current_power_enemy = obj_eye_powered_up
{
current_power_enemy = obj_eye_lava_power
}
else if current_power_enemy = obj_eye_lava_power
{
current_power_enemy = obj_eye_water_power
}
else if current_power_enemy = obj_eye_water_power
{
current_power_enemy = obj_eye_electro_sand_power
}
else if current_power_enemy = obj_eye_electro_sand_power
{
current_power_enemy = obj_eye_powered_up
}

