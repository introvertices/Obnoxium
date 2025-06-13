global.playerAtk += irandom_range(1,14)
global.playerHP += irandom_range(20,44)
global.playerMaxHP = global.playerHP
global.playerSin += irandom_range(1,56)
global.playerDodge = round((57 - global.playerSin) / 10)


lastHits = []
playerStats = [global.playerAtk,global.playerHP,global.playerSin]