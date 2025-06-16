tile = 32
yHeight = tile * 5

image_speed = 0

formatScore = format_scientific(global.slotScore)
colourScore = [c_orange,c_white,c_yellow,c_red]
colourStep = 0.1
lerpProgress = 0
pingPong = abs(sin(lerpProgress))


stats = {playerhp: format_scientific(global.playerHP),
    playerMaxHP: format_scientific(global.playerMaxHP),
    playerAtk: format_scientific(global.playerAtk + global.attackMod),
    playerSin: format_scientific(global.playerSin),
    dungeonLevel: global.dungeonWins,
    kills: global.kills,
    deaths: global.deaths
}

// max 3 items held
equipmentArray = []

eq1 = 0
eq2 = 0
eq3 = 0

totalAtkMod = 0
totalSpeedMod = 0
isCrumbed = 0
crumbMod = 1 + round(global.cookieClicked / 2)

slotsStopped = []

mouseover = false
mouseoverData = []
