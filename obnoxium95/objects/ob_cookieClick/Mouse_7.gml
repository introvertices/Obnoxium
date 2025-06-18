image_index = 0
var roll = irandom(25)

if (roll <=2){
    C_gameroomMgr.isCrumbed = 1
    C_gameroomMgr.alarm[0] = 3
}
else {C_gameroomMgr.isCrumbed = 0}

global.cookieClicked +=1
global.slotScore += 1 + (global.cookieClicked/2)

global.cookieClicksToGo = global.cookieTotal - global.cookieClicked

audio_play_sound(sfx_cronch,1,false)
 
x = irandom_range(64,800)
y = irandom_range(64,room_height-64)