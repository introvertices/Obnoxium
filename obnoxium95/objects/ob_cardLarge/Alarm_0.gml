burn = false

// create burn
instance_create_layer(x,y,"particles",par_burn,{
    image_angle: image_angle, objectParent: id})

alarm[1] = 50