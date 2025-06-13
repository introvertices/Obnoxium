move_bounce_solid(true)


// prevent absolute vertical nonsense
if (direction == 90) || (direction == 270){
    direction += irandom_range(13,35)
}