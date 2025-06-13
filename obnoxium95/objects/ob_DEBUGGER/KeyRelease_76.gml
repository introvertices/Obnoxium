global.dungeonMod += 1
instance_destroy(ob_enemytuntun)

for (var i=0; i < 5; i++){
    
    instance_create_layer(irandom_range(64,room_width-64),irandom_range(64,room_height-64),"Instances",ob_enemytuntun)}

var numtotest = irandom(50000000000000000000)

var formatnum = format_scientific(numtotest, 2)

show_debug_message(formatnum)