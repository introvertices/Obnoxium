randomize()

// disable when done
global.debug = true

global.roomTarget = r_title
global.buttonClicked = false


// Player handlers
global.allowControl = true

// Roguelike boi

global.playerHP = 0
global.playerMaxHP = 0
global.playerAtk = 0
global.playerSin = 0
global.playerDodge = 56 - global.playerSin
global.playerDodgeMax = 75

// stats
global.cardsFlipped = 0
global.cookieClicked = 0
global.spins = 0
global.kills = 0
global.deaths = 0
global.dungeonWins = 0
global.dungeonMod = 1        // dungeonlevel




// marketing bonuses

global.gooner = false        // Try and move the title box
global.roguelike = 0         // Die in the tunnel x times
global.idler = 0             // level up unc the homunc x times
global.deckbuilder = 0       // flip x cards
global.viral = 0             // reach x damage
global.overflow = false      // buffer overflow the cookie
global.sugarfree = false     // honour the GDPR and get the cookie to 0
global.bigshot = 0           // jackpot x times
global.mildNudity = false    // make a new fella in all his slimy nude glory
global.oldmcdonalds = 0      // grow x things in the 'garden'