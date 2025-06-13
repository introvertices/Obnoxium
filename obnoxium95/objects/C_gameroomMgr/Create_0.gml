tile = 32
yHeight = tile * 5




stats = {playerhp: format_scientific(global.playerHP),
    playerMaxHP: format_scientific(global.playerMaxHP),
    playerAtk: format_scientific(global.playerAtk),
    playerSin: format_scientific(global.playerSin),
    dungeonLevel: global.dungeonWins,
    kills: global.kills,
    deaths: global.deaths
}