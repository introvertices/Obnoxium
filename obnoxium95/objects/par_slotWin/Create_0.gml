animations = [
[sp_slotWin_beefed,vsfx_beefed],
[sp_slotWin_dmgup,vsfx_dmg],
[sp_slotWin_enemy,vsfx_plumpy],
[sp_slotWin_health,vsfx_heart],
[sp_slotWin_glitch,vsfx_glitch]
]

if (!variable_instance_exists(id, "loadimg")) {
    loadimg = 4; // Only set if not already set
}


sprite_index = animations[loadimg][0]

snd = animations[loadimg][1]

audio_play_sound(snd,1,false)

