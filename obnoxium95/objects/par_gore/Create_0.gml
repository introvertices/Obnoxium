alarm[0] = 0.75 * game_get_speed(gamespeed_fps)


image_speed = 0
image_index = irandom(sprite_get_number(sp_par_gore))

image_angle = irandom(365)

hspeed = irandom_range(-3,3)
vspeed = -2

gravity = 0.1
gravity_direction = 270