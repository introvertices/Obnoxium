move_bounce_solid(true)
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
    direction += irandom_range(13,35)
}