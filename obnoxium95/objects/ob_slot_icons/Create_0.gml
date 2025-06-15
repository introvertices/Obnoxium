// set up slot to have a random sub image and stopped

image_speed = 0
image_index = irandom(sprite_get_number(sp_slot_icons) -1)
if (image_index % 2 == 1){
    image_index += 1
}


slotSpinning = false
stopSlots = false
speedMod = 0