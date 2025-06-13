randomize()


// Grid and collision checking for spawning

if !place_snapped(32, 32)
    {
        move_snap(32, 32);
    }

if (!place_empty(x,y,ob_solid)){
    instance_destroy(other)
}

// Sprite set up

image_speed = 0
image_index = irandom(sprite_get_number(sprite_index))


// Movement set up
speed = 3
direction = irandom(365)


// prevent absolute vertical nonsense
if (direction == 90) || (direction == 270){
    direction += irandom_range(3,30)
}


// set up enemy stats
show_hp = false
takedmg = true
difficulty = 0

// collision stats
dmgToSelf = 0
dmgToPlayer = 0
realDeath = false



switch (image_index){
    case 0:{difficulty = 1.2; break}        // Slime
    case 1:{difficulty = 1.5; break}       // Skull
    case 2:{difficulty = 1.75; break}       // Snail
    case 3:{difficulty = 2; break}          // Ghost
    case 4:{difficulty = 2.5; break}        // Cheese
    case 5:{difficulty = 3; break}          // Mouth
    
    default:{difficulty = 1.5; break}

}

enemyCreate = enemyStats(global.dungeonMod,difficulty)


// Set up for the percent bar
hpPercent = floor(((enemyCreate.currenthp / enemyCreate.maxhp) * 100) /2)


centerPoint = sprite_width/2