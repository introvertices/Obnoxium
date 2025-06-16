image_speed = 0
clickamount = irandom_range(1,25)
text = "Hey Bozo! Ya got crumbs in my machine!!! You have 5 seconds to do " + string(clickamount) +" clicks on me or I'll 'splode ya dingus with a bunch of BAD STUFF!! HAHAH!!"

if (!variable_instance_exists(id, "bombdmg")) {
    bombdmg = 1; // Only set if not already set
}

alarm[0] = 5 * game_get_speed(gamespeed_fps)

hspeed = choose(-1.5,-1,1,1.5)
vspeed = choose(-1.25,-1,1,1.25)