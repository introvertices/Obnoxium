image_speed = 0

//anteChoices = choose("score","cookie","sin","plumpy","snail")
currentAnte = 1
failedAntes = 0
allowComplete = true

quest=[0,"",""]    // target, quest text, quest type

captureStat = 0
trackStat = 0
winningSnail = ""

anteTimer = 40
alarm[0] = 5
alarm[1] = 1 * game_get_speed(gamespeed_fps)
