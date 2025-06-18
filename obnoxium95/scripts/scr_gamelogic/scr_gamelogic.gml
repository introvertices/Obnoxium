function spawnRocks(spawnRange,object){
    
    for (var i = 0; i <= irandom_range(4,12); i++){
    instance_create_layer(irandom_range(spawnRange[0],spawnRange[1]),irandom_range(spawnRange[2],spawnRange[3]),"Instances",object,{
        hp: choose(4,8,10,12,16)})

}}


function spawnEnemy(spawnRange,object){
    for (var i = 0; i <= irandom_range(2,5); i++){
        instance_create_layer(irandom_range(spawnRange[0],spawnRange[1]),irandom_range(spawnRange[2],spawnRange[3]),"Instances",object)
    }
}



function enemyStats(level,difficultyMod){
    

    
    base_hp = 20 * random_range(0.8,2)
    base_atk = power(2,choose(1,1.25,1.3))        // will scale as layer increases in power
    dodge = ceil(global.playerSin / 10)                     // max is 56, so divided by 10 would be 5.6 % dodge cap at 75% dodge
    
    
    maxhp = ceil((base_hp * level) * difficultyMod)
    attack = ceil((base_atk * level) * difficultyMod)
    
    
    // check for zeroes
    
    if (dodge == 0){
        dodge = 1
    }
    
    if dodge > 75{
        dodge = 75
    }
    
    
    enemy = {
        maxhp: maxhp,
        currenthp: maxhp,
        attack: attack,
        dodge: dodge

    }
    
    
    return enemy
}




function slotWins(s1,s2,s3){
    var prize = 0
    var prize2 = 0
    
    // Gift win
    if (s1 == 0) && (s2 == 0) && (s3 == 0){
        // Give equipment
        var newEquipment = createEquip()
        
        // check equip array length
        array_insert(C_gameroomMgr.equipmentArray,0,newEquipment)
        if (array_length(C_gameroomMgr.equipmentArray) > 3){
            array_pop(C_gameroomMgr.equipmentArray)
        } 
        
        with(C_gameroomMgr){
            event_user(2)
        }
        
        // score
        global.slotScore += 1000
        
        
        show_debug_message(newEquipment)
        show_debug_message(C_gameroomMgr.equipmentArray)
        
        
    }
    
    // Sin Win
    if (s1 == 2) && (s2 == 2) && (s3 == 2){
        // Give sin
        prize = 2.5 * global.deaths
        
        // send to Sin stat
        global.playerSin += prize
        
        // spawn anim if applicable
        instance_create_layer(0,0,"ol",par_slotWin,{
            loadimg:0})
        // score
        global.slotScore -= 200
    }
    
    // Enemy win
    if (s1 == 4) && (s2 == 4) && (s3 == 4){
        // Give enemies
        
        with (ob_tuntunSpawner){
            event_user(0)
        }
        
        // add to difficulty mod
        prize = 0.3
        
        // send to dungeon mod
        global.dungeonMod += prize
        
        // spawn anim if applicable
        instance_create_layer(0,0,"ol",par_slotWin,{
            loadimg:2})
        
        
        // score
        global.slotScore += 10
        
    }
    
    // Sword win
    if (s1 == 6) && (s2 == 6) && (s3 == 6){
        // Give dmg
        prize = round(2 * global.kills)
        
        // send to atk
        global.playerAtk += prize
        
        // spawn anim if applicable
        instance_create_layer(0,0,"ol",par_slotWin,{
            loadimg:1})
        
        // score
        global.slotScore += 1000
        
    }
    
    // hearts win
    if (s1 == 8) && (s2 == 8) && (s3 == 8){
        // Give hearts
        prize = round(10 * global.dungeonWins)
        prize2 = round(prize/2)                        // heals for 50%
        
        // send to max hp
        global.playerMaxHP += prize
        
        // heal player
        global.playerHP += prize2
        
        // spawn anim if applicable
        instance_create_layer(0,0,"ol",par_slotWin,{
            loadimg:3})
        
        // score
        global.slotScore += 500
    }
    
    // coins win
    if (s1 == 10) && (s2 == 10) && (s3 == 10){
        // Give score
        prize = 1000 * global.kills
        
        // send to score
        global.slotScore += prize
        
        audio_play_sound(sfx_coin,1,false)
        
        var roll = random(15)
        if (roll <=1){
            instance_create_layer(0,0,"ol",par_slotWin,{
            loadimg:4})
        }
        
    }
    
}




function anteEater(){
    anteChoices = choose("score","cookie","sin","plumpy","snail")
    goal = 0
    quest = []
    
    switch anteChoices{
        
        case "score":{
            goal = (global.slotScore * 2) + 10000 
            quest = [goal, "Reach " +string(goal) +" points!"]
            break
        }
        
        case "cookie":{
            goal = irandom_range(30,60) 
            quest = [goal, "Click " +string(goal) +" cookies!"]
            break
        }
        
        
        case "sin":{            
            goal = (global.slotScore * 2) + 10000 
            quest = [goal, "Reach " +string(goal) +" points!"]
            break
            
        }
        
        case "plumpy":{
            goal = 1 
            quest = [goal, "Beef it " +string(goal) +" time!"]
            break
            
        }
        
        case "snail":{
            goal = choose("Red","Blue") 
            quest = [goal, string(goal) +" snail wins a race!"]
            break
            
        }
        
    }
    
    
    return quest
}


// HELPERS

function format_scientific(_number, _decimal_places = 2) {
    if (_number == 0) return "0";
        
    if (_number <=100000000) return string(_number)
        
    else{
    
    var exponent = floor(log10(abs(_number)));
    var mantissa = _number / power(10, exponent);
    
    return string_format(mantissa, 1, _decimal_places) + "e" + 
           (exponent >= 0 ? "+" : "") + string(exponent);
    }
}


function createEquip(){
    
    var equipSpriteIndex = 0
    var borderSpriteIndex = 0
    
    var prefix = choose("Crap", "Lame", "Tepid", "Cool", "Stunning","Unholy", "Smelly", "Swift", "Rancid")
    var suffix = choose("Weasel Slammer", "Knuckle Licker", "Tommyknocker", "Pint Glass", "Smashed Avocado", "Loaded Dice", "Can Opener", "Fishfingers", "Mouse Trap", "Youtube Sponsorship", "Streamer Bait")
    
    var itemName = string(prefix) + " " + string(suffix)
    
    var attackPwr = 1 + (global.dungeonWins * global.kills)
    if (global.playerSin >= (global.kills * 10)) && (attackPwr >= 2){
        attackPwr /= 2
    }
    
    var speedMod = 4
    if (prefix == "Swift"){
        speedMod = 7
    } 
    else if (prefix == "Rancid"){
        speedMod = 3
    }
    
    if (prefix =="Stunning"){
        attackPwr += 5
    }
    else if (prefix == "Cool") || (prefix == "Unholy"){
        attackPwr += 3
    }
    
    // Borders
    
    if (prefix == "Crap") || (prefix == "Smelly") || (prefix == "Lame") || (prefix == "Rancid"){
        borderSpriteIndex = 1
        
    }
    else if (prefix == "Tepid") || (prefix == "Swift") || (prefix == "Cool"){
        borderSpriteIndex = 2
        
    }
    else if (prefix == "Stunning") || (prefix == "Unholy"){
        borderSpriteIndex = 3
    }
    
    // Sprites
    var equipSprites = ["None","Weasel Slammer", "Knuckle Licker", "Tommyknocker", "Pint Glass", "Smashed Avocado", "Loaded Dice", "Can Opener", "Fishfingers", "Mouse Trap", "Youtube Sponsorship", "Streamer Bait"]
    for (var i = 0; i < array_length(equipSprites); i++){
        if (suffix == equipSprites[i]){
            equipSpriteIndex = i
        }
    }
    
    
    newItem = {
        name:itemName,
        level: ceil(global.dungeonWins + 1),
        attack: attackPwr,
        speed: speedMod,
        sprite: equipSpriteIndex,
        border: borderSpriteIndex }
    
    return newItem
    
}