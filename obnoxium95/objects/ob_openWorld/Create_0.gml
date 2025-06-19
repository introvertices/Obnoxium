worlds = []

for (var i = 0; i < 100; i++){
    
    newWorld = string(irandom(500000)) +"," +string(irandom(500000))
    array_push(worlds, newWorld)
}


alarm[0] = irandom_range(100,666)