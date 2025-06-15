totalAtkMod = 0
totalSpeedMod = 0

if (array_length(equipmentArray) == 1){
    // equipment drawing
    eq1.border = equipmentArray[0].border
    eq1.icon = equipmentArray[0].sprite
    eq1.attack = equipmentArray[0].attack
    eq1.speedmod = equipmentArray[0].speed
    eq1.item = equipmentArray[0]
    
    totalAtkMod += equipmentArray[0].attack
    totalSpeedMod += equipmentArray[0].speed
    
}
else if (array_length(equipmentArray) == 2){
    // equipment drawing
    eq1.border = equipmentArray[0].border
    eq1.icon = equipmentArray[0].sprite
    eq1.attack = equipmentArray[0].attack
    eq1.speedmod = equipmentArray[0].speed
    eq1.item = equipmentArray[0]
    
    // equipment drawing
    eq2.border = equipmentArray[1].border
    eq2.icon = equipmentArray[1].sprite
    eq2.attack = equipmentArray[1].attack
    eq2.speedmod = equipmentArray[1].speed
    eq2.item = equipmentArray[1] 
    
    totalAtkMod += equipmentArray[0].attack + equipmentArray[1].attack
    totalSpeedMod += equipmentArray[0].speed + equipmentArray[1].speed
    
}
else if (array_length(equipmentArray) >=3){
    // equipment drawing
    eq1.border = equipmentArray[0].border
    eq1.icon = equipmentArray[0].sprite
    eq1.attack = equipmentArray[0].attack
    eq1.speedmod = equipmentArray[0].speed
    eq1.item = equipmentArray[0]
    
    // equipment drawing
    eq2.border = equipmentArray[1].border
    eq2.icon = equipmentArray[1].sprite
    eq2.attack = equipmentArray[1].attack
    eq2.speedmod = equipmentArray[1].speed
    eq2.item = equipmentArray[1]
    
    // equipment drawing
    eq3.border = equipmentArray[2].border
    eq3.icon = equipmentArray[2].sprite
    eq3.attack = equipmentArray[2].attack
    eq3.speedmod = equipmentArray[2].speed
    eq3.item = equipmentArray[2]
    
    totalAtkMod += equipmentArray[0].attack + equipmentArray[1].attack + equipmentArray[2].attack
    totalSpeedMod += equipmentArray[0].speed + equipmentArray[1].speed + equipmentArray[2].speed
}

global.attackMod = totalAtkMod
global.speedMod = totalSpeedMod

