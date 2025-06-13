if !place_snapped(32, 32)
    {
        move_snap(32, 32);
    }

if (!place_empty(x,y,ob_solid)){
    instance_destroy(other)
}

stareDir = 0
image_speed = 0

speed = 4
direction = irandom(365)


spawnX = x
spawnY = y
global.playerHP = global.playerMaxHP

if (direction >=0) && (direction <= 90){
    stareDir = 0
}

else if (direction >=270) && (direction <= 360){
    stareDir = 1
}

else if (direction >=180) && (direction <= 270){
    stareDir = 2
}

else if (direction >=90) && (direction <= 180){
    stareDir = 3
}

// prevent absolute vertical nonsense
if (direction == 90) || (direction == 270){
    direction += irandom_range(3,30)
}


// health management

takedmg = true
show_hp = false

// Set up for the percent bar
//hpPercent = floor(((global.playerHP / global.playerMaxHP) * 100) /2)
