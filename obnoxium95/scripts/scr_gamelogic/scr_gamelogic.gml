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
        
        var roll = random(5)
        if (roll <=1){
            instance_create_layer(0,0,"ol",par_slotWin,{
            loadimg:4})
        }
        
    }
    
}




function anteEater(){
    //anteChoices = choose("score","cookie","sin","plumpy","snail")
    anteChoices = choose("score","cookies","snail")
    goal = 0
    quest = []
    
    switch anteChoices{
        
        case "score":{
            if (global.slotScore < 90000){
            goal = (global.slotScore * 1.7) + 5000 
            }
            else {goal = (global.slotScore * 1.15) + 1000}
            quest = [goal, "Reach " +string(goal) +" points!", anteChoices]
            
            // set ante objective vars
            ob_anteTimer.captureStat = global.slotScore
            ob_anteTimer.trackStat = goal
            
            break
        }
        
        case "cookies":{
            goal = irandom_range(8,15) 
            quest = [goal, "Click " +string(goal) +" cookies!", anteChoices]
            
            // set ante objective vars
            ob_anteTimer.captureStat = global.cookieClicked
            ob_anteTimer.trackStat = ob_anteTimer.captureStat + goal
            
            break
        }
        
        
        //case "sin":{            
            //goal = irandom_range(3,8) 
            //quest = [goal, "Beef it for +" +string(goal) +" sin!", anteChoices]
            //
            //// set ante objective vars
            //ob_anteTimer.captureStat = global.playerSin
            //ob_anteTimer.trackStat = ob_anteTimer.captureStat + goal
            //break
            //
        //}
        //
        //case "plumpy":{
            //goal = irandom_range(2,7) 
            //quest = [goal, "Get total +" +string(goal) +" Plumpy kills!", anteChoices]
            //
            //// set ante objective vars
            //ob_anteTimer.captureStat = global.kills
            //ob_anteTimer.trackStat = captureStat + goal
            //
            //
            //
            //break
            //
        //}
        
        case "snail":{
            goal = choose("Red","Blue") 
            quest = [goal, string(goal) +" snail wins a race! (CLICK HIM!)", anteChoices]
            
            // set ante objective vars
            ob_anteTimer.captureStat = 0
            ob_anteTimer.trackStat = 0
            break
            
        }
        
    }
    
    
    return quest
}


// HELPERS


function cardMap(){
    card_map = ds_map_create();



    ds_map_add(card_map, 0, "Depressed Pickle|2|Deals damage to itself when played|Why did I become a condiment?");
    ds_map_add(card_map, 1, "Anxious Toaster|4|Burns all bread cards in play|I just wanted to make breakfast!");
    ds_map_add(card_map, 2, "Existential WiFi Router|1|Disconnects everyone randomly|Nobody understands my packets!");
    ds_map_add(card_map, 3, "Caffeinated Sloth|8|Moves extremely slowly but hits hard|NEED. MORE. COFFEE. PLEASE.");
    ds_map_add(card_map, 4, "Procrastinating Phoenix|6|Respawns next turn instead of this turn|I'll rise from ashes tomorrow...");
    ds_map_add(card_map, 5, "Introverted Megaphone|3|Whispers instead of shouting|Can everyone please be quieter?");
    ds_map_add(card_map, 6, "Overworked Hamster|5|Runs twice as fast but takes stress damage|The wheel never stops spinning!");
    ds_map_add(card_map, 7, "Pessimistic Rainbow|2|Makes all colors grey|What's the point of being colorful?");
    ds_map_add(card_map, 8, "Lactose Intolerant Cow|4|Cannot be played with dairy cards|This is literally my job though!");
    ds_map_add(card_map, 9, "Socially Awkward Butterfly|1|Flutters away when looked at|Please don't perceive me...");
    ds_map_add(card_map, 10, "Unemployed Superhero|7|Great power, terrible resume|I have a PhD in Justice Studies!");
    ds_map_add(card_map, 11, "Vegan Vampire|3|Only drains plant-based blood|Do you have any oat milk necks?");
    ds_map_add(card_map, 12, "Narcoleptic Alarm Clock|2|Falls asleep mid-ring|Just five more min... zzz");
    ds_map_add(card_map, 13, "Claustrophobic Cave Troll|9|Cannot be played in small spaces|These dungeons are too cramped!");
    ds_map_add(card_map, 14, "Diabetic Dragon|6|Cannot hoard sugar treasures|My blood sugar is already high!");
    ds_map_add(card_map, 15, "Broke Billionaire|1|Rich in sadness, poor in coins|I lost it all on crypto cats!");
    ds_map_add(card_map, 16, "Colorblind Chameleon|3|Changes to wrong colors constantly|Is this green? This looks green...");
    ds_map_add(card_map, 17, "Vegetarian Shark|5|Only eats seaweed cards|My family disowned me...");
    ds_map_add(card_map, 18, "Insomniac Sandman|4|Keeps everyone awake instead|I haven't slept in 47 years!");
    ds_map_add(card_map, 19, "Technophobic Robot|8|Malfunctions near electronics|BEEP BOOP ERROR HELP HUMAN");
    ds_map_add(card_map, 20, "Agoraphobic Giant|10|Refuses to leave small spaces|Outside is too... outside!");
    ds_map_add(card_map, 21, "Pacifist Berserker|0|Apologizes while attacking|I'm sorry! I'm so sorry!");
    ds_map_add(card_map, 22, "Gluten-Free Wheat Field|2|Contradicts its own existence|I don't understand what I am!");
    ds_map_add(card_map, 23, "Minimalist Hoarder|1|Collects one of everything|I need this singular paperclip!");
    ds_map_add(card_map, 24, "Extroverted Hermit|3|Lives alone but talks constantly|IS ANYONE OUT THERE?!");
    ds_map_add(card_map, 25, "Invisible Attention Seeker|5|You can't see me but I'm here!|NOTICE ME! VALIDATE MY EXISTENCE!");
    ds_map_add(card_map, 26, "Mute Opera Singer|6|Performs silently with great passion|*gestures dramatically in silence*");
    ds_map_add(card_map, 27, "Acrophobic Pilot|4|Crashes when played at high altitude|Why did I choose this career?!");
    ds_map_add(card_map, 28, "Aquaphobic Fish|2|Dies in water environments|This is literally my habitat!");
    ds_map_add(card_map, 29, "Nocturnal Sun|7|Only works at night|My schedule is completely backwards!");
    ds_map_add(card_map, 30, "Diurnal Bat|3|Sleeps through its own attacks|Echo... location... zzz...");
    ds_map_add(card_map, 31, "Germaphobic Bacteria|1|Sanitizes itself constantly|I'm destroying my own kind!");
    ds_map_add(card_map, 32, "Commitment-Phobic Wedding Ring|4|Disappears when relationships get serious|It's not you, it's me!");
    ds_map_add(card_map, 33, "Indecisive Coin|0|Lands on its edge every time|Heads? Tails? I can't choose!");
    ds_map_add(card_map, 34, "Pessimistic Fortune Teller|5|Predicts only bad futures|You will step on a Lego tomorrow!");
    ds_map_add(card_map, 35, "Optimistic Grim Reaper|8|Tries to cheer people up while reaping|Your death will be AMAZING!");
    ds_map_add(card_map, 36, "Honest Politician|2|Tells the truth and loses all power|I actually don't know what I'm doing!");
    ds_map_add(card_map, 37, "Humble Narcissist|6|Brags about being modest|I'm the most humble person ever!");
    ds_map_add(card_map, 38, "Organized Chaos|4|Makes everything messier while cleaning|I'm helping! ...Right?");
    ds_map_add(card_map, 39, "Silent Scream|7|Shouts quietly|AAAAAHHHHH! (but whispered)");
    ds_map_add(card_map, 40, "Freezing Fire|5|Burns with ice damage|I'm having an identity crisis!");
    ds_map_add(card_map, 41, "Clumsy Ninja|3|Trips over own smoke bombs|The shadows betray me constantly!");
    ds_map_add(card_map, 42, "Punctual Procrastinator|1|Always late to being on time|I'll be there eventually!");
    ds_map_add(card_map, 43, "Healthy Junk Food|2|Nutritious but tastes terrible|I'm good for you but at what cost?");
    ds_map_add(card_map, 44, "Mature Teenager|9|Acts like an adult, confuses everyone|I have a mortgage at 16!");
    ds_map_add(card_map, 45, "Energetic Sloth|1|Moves fast but accomplishes nothing|I'm speed! ...Eventually!");
    ds_map_add(card_map, 46, "Sophisticated Caveman|7|Uses big words while grunting|Ugg think therefore ugg am!");
    ds_map_add(card_map, 47, "Temporary Permanent Marker|3|Fades away immediately|I was supposed to last forever!");
    ds_map_add(card_map, 48, "Friendly Fire|6|Burns allies instead of enemies|I'm on your side! Wait, no!");
    ds_map_add(card_map, 49, "Constructive Criticism|4|Builds while destroying|You're terrible! Here's a house!");
    ds_map_add(card_map, 50, "Living Death|8|Dead but still pays taxes|Being undead is expensive!");
    ds_map_add(card_map, 51, "Final Beginning|10|Ends everything to start over|This is my first last chance!");
    
    
    return card_map

}

function get_random_card() {
    var random_id = irandom(51);  // 0 to 51
    var card_data = ds_map_find_value(ob_deckbuild.cards, random_id);
    return {
        id: random_id,
        data: card_data
    };
}


function parse_card_data(card_data_string) {
    var parts = string_split(card_data_string, "|");
    return {
        name: parts[0],
        attack: real(parts[1]),
        ability: parts[2],
        cry_for_help: parts[3]
    };
}



function chatMap(){
    chat_messages = ds_list_create()
    
    ds_list_add(chat_messages, "PogChamp first!");
    ds_list_add(chat_messages, "is this really what we're watching today?");
    ds_list_add(chat_messages, "KEKW this game literally plays itself");
    ds_list_add(chat_messages, "streamer too lazy to play real games LUL");
    ds_list_add(chat_messages, "cookie cookie cookie cookie");
    ds_list_add(chat_messages, "how is this entertaining???");
    ds_list_add(chat_messages, "watching paint dry would be more exciting");
    ds_list_add(chat_messages, "OMEGALUL actually watching an idle game");
    ds_list_add(chat_messages, "just here for the chat tbh");
    ds_list_add(chat_messages, "this is peak content right here Kappa");
    ds_list_add(chat_messages, "snails are OP nerf plz");
    ds_list_add(chat_messages, "ResidentSleeper");
    ds_list_add(chat_messages, "5Head clicking cuckies");
    ds_list_add(chat_messages, "why not just leave this running overnight lol");
    ds_list_add(chat_messages, "CLICKCLICKCLICKCLICK");
    ds_list_add(chat_messages, "mom's credit card for cookies OMEGALUL");
    ds_list_add(chat_messages, "this is what's wrong with gaming today");
    ds_list_add(chat_messages, "easy views EZ Clap");
    ds_list_add(chat_messages, "streamer bait game detected");
    ds_list_add(chat_messages, "the absolute state of twitch");
    ds_list_add(chat_messages, "imagine getting carpal tunnel from this LULW");
    ds_list_add(chat_messages, "cookies > subscriber count KEKW");
    ds_list_add(chat_messages, "at least it's not another battle royale");
    ds_list_add(chat_messages, "WeirdChamp what am I watching");
    ds_list_add(chat_messages, "COOKIE MONSTER APPROVES");
    ds_list_add(chat_messages, "this takes no skill whatsoever");
    ds_list_add(chat_messages, "my grandma could play this better");
    ds_list_add(chat_messages, "and she's DEAD");
    ds_list_add(chat_messages, "POGGERS big number go up");
    ds_list_add(chat_messages, "capitalism simulator 2025");
    ds_list_add(chat_messages, "when does the game actually start?");
    ds_list_add(chat_messages, "PepeLaugh doesn't know about golden cookies");
    ds_list_add(chat_messages, "cookie empire when?");
    ds_list_add(chat_messages, "@streamer click faster noob");
    ds_list_add(chat_messages, "this is why aliens won't visit us");
    ds_list_add(chat_messages, "numbers go brrrrr");
    ds_list_add(chat_messages, "CLICKCLICKCLICKCLICKCLICK");
    ds_list_add(chat_messages, "my autism is pleased by the numbers");
    ds_list_add(chat_messages, "EZ content EZ money");
    ds_list_add(chat_messages, "literally watching someone else waste time");
    ds_list_add(chat_messages, "grandpocalypse when PogChamp");
    ds_list_add(chat_messages, "cookie dough > chocolate chip fight me");
    ds_list_add(chat_messages, "this game has no soul");
    ds_list_add(chat_messages, "at least we're not watching ASMR");
    ds_list_add(chat_messages, "BIG COOKIE ENERGY");
    ds_list_add(chat_messages, "streamer discovers capitalism circa 2013");
    ds_list_add(chat_messages, "imagine donating to watch this OMEGALUL");
    ds_list_add(chat_messages, "F in chat for actual gameplay");
    ds_list_add(chat_messages, "F");
    ds_list_add(chat_messages, "F");
    ds_list_add(chat_messages, "cookie empire > roman empire");
    ds_list_add(chat_messages, "this is peak human evolution");
    ds_list_add(chat_messages, "KAPPA 123");
    ds_list_add(chat_messages, "why am I still here? just to suffer?");
    ds_list_add(chat_messages, "when you realize you've been watching for 2 hours");
    ds_list_add(chat_messages, "cookie addiction is real chat");
    ds_list_add(chat_messages, "cursor working harder than the streamer");
    ds_list_add(chat_messages, "pepehands my life choices");
    ds_list_add(chat_messages, "this is art");
    ds_list_add(chat_messages, "modern art is dead");
    ds_list_add(chat_messages, "LULW imagine getting excited about cookies");
    ds_list_add(chat_messages, "POG GOLDEN COOKIE");
    ds_list_add(chat_messages, "CLICK IT CLICK IT CLICK IT");
    ds_list_add(chat_messages, "streamer has slower reflexes than my pet rock");
    ds_list_add(chat_messages, "cookie clicker speedrun any%");
    ds_list_add(chat_messages, "world record attempt KEKW");
    ds_list_add(chat_messages, "this chat has more personality than the game");
    ds_list_add(chat_messages, "5Head just use an autoclicker");
    ds_list_add(chat_messages, "that's cheating WeirdChamp");
    ds_list_add(chat_messages, "everything is cheating in idle games");
    ds_list_add(chat_messages, "TRUEEEE");
    ds_list_add(chat_messages, "brain = off, cookies = on");
    ds_list_add(chat_messages, "this is meditative actually");
    ds_list_add(chat_messages, "zen and the art of cookie clicking");
    ds_list_add(chat_messages, "mom look I'm famous");
    ds_list_add(chat_messages, "we're all just numbers in the end");
    ds_list_add(chat_messages, "existential cookie crisis");
    ds_list_add(chat_messages, "OMEGALUL philosophy in cookie clicker chat");
    ds_list_add(chat_messages, "deepest twitch chat 2025");
    ds_list_add(chat_messages, "still better than fortnite");
    ds_list_add(chat_messages, "controversial take but true");
    ds_list_add(chat_messages, "at least cookies don't have battle passes");
    ds_list_add(chat_messages, "don't give them ideas");
    ds_list_add(chat_messages, "cookie clicker premium when?");
    ds_list_add(chat_messages, "EA wants to know your location");
    ds_list_add(chat_messages, "pay $4.99 to unlock chocolate chips");
    ds_list_add(chat_messages, "NOOOO");
    ds_list_add(chat_messages, "this timeline is cursed");
    ds_list_add(chat_messages, "cookies per second = life success rate");
    ds_list_add(chat_messages, "mathematician approved content");
    ds_list_add(chat_messages, "exponential growth PogChamp");
    ds_list_add(chat_messages, "this is what peak performance looks like");
    ds_list_add(chat_messages, "imagine explaining this to someone from 1950");
    ds_list_add(chat_messages, "grandpa wouldn't understand");
    ds_list_add(chat_messages, "back in my day cookies came from ovens");
    ds_list_add(chat_messages, "OK BOOMER");
    ds_list_add(chat_messages, "cookies have evolved beyond physical form");
    ds_list_add(chat_messages, "we live in a simulation");
    ds_list_add(chat_messages, "and it's made of cookies");
    ds_list_add(chat_messages, "matrix but tasty");
    ds_list_add(chat_messages, "blue pill = stop watching");
    ds_list_add(chat_messages, "red pill = keep clicking");
    ds_list_add(chat_messages, "I choose cookies");
    ds_list_add(chat_messages, "valid life choice");
    ds_list_add(chat_messages, "BASED");
    ds_list_add(chat_messages, "cookie pilled");
    ds_list_add(chat_messages, "this chat is losing it");
    ds_list_add(chat_messages, "sanity is overrated anyway");
    ds_list_add(chat_messages, "embrace the madness");
    ds_list_add(chat_messages, "one of us one of us");
    ds_list_add(chat_messages, "cookie cult confirmed");
    ds_list_add(chat_messages, "all hail the great cookie");
    ds_list_add(chat_messages, "in cookies we trust");
    ds_list_add(chat_messages, "amen");
    ds_list_add(chat_messages, "blessed be the clicks");
    ds_list_add(chat_messages, "and also with you");
    ds_list_add(chat_messages, "this is a religious experience");
    ds_list_add(chat_messages, "church of cookie clicker");
    ds_list_add(chat_messages, "our savior orteil");
    ds_list_add(chat_messages, "praise be");
    ds_list_add(chat_messages, "creator of worlds");
    ds_list_add(chat_messages, "worlds made of cookies");
    ds_list_add(chat_messages, "the best kind of world");
    ds_list_add(chat_messages, "paradise found");
    ds_list_add(chat_messages, "this is it chief");
    ds_list_add(chat_messages, "peak human achievement");
    ds_list_add(chat_messages, "we did it reddit");
    ds_list_add(chat_messages, "society has peaked");
    ds_list_add(chat_messages, "nowhere to go but down");
    ds_list_add(chat_messages, "or sideways into more cookies");
    ds_list_add(chat_messages, "always more cookies");
    ds_list_add(chat_messages, "infinite cookies infinite possibilities");
    ds_list_add(chat_messages, "the cookie multiverse");
    ds_list_add(chat_messages, "every click creates a new timeline");
    ds_list_add(chat_messages, "somewhere there's a timeline where cookies click you");
    ds_list_add(chat_messages, "soviet russia joke incoming");
    ds_list_add(chat_messages, "in soviet russia cookie clicks you");
    ds_list_add(chat_messages, "there it is");
    ds_list_add(chat_messages, "comedy achieved");
    ds_list_add(chat_messages, "humor has been accomplished");
    ds_list_add(chat_messages, "pack it up boys we're done here");
    ds_list_add(chat_messages, "but the cookies never end");
    ds_list_add(chat_messages, "eternal cookie cycle");
    ds_list_add(chat_messages, "samsara but with baked goods");
    ds_list_add(chat_messages, "nirvana is 1 trillion cookies per second");
    ds_list_add(chat_messages, "enlightenment through idle gaming");
    ds_list_add(chat_messages, "buddha would be proud");
    ds_list_add(chat_messages, "or very confused");
    ds_list_add(chat_messages, "probably confused");
    ds_list_add(chat_messages, "same tbh");
    ds_list_add(chat_messages, "confusion is the natural state");
    ds_list_add(chat_messages, "embrace the confusion");
    ds_list_add(chat_messages, "let it wash over you");
    ds_list_add(chat_messages, "like a warm wave of cookies");
    ds_list_add(chat_messages, "that sounds nice actually");
    ds_list_add(chat_messages, "cookie tsunami");
    ds_list_add(chat_messages, "death by cookies");
    ds_list_add(chat_messages, "what a way to go");
    ds_list_add(chat_messages, "better than most alternatives");
    ds_list_add(chat_messages, "death by cookies > death by powerpoint");
    ds_list_add(chat_messages, "corporate nightmares");
    ds_list_add(chat_messages, "at least cookies are honest about being meaningless");
    ds_list_add(chat_messages, "brutal honesty");
    ds_list_add(chat_messages, "respect for keeping it real");
    ds_list_add(chat_messages, "cookies don't lie to you");
    ds_list_add(chat_messages, "they just exist");
    ds_list_add(chat_messages, "pure existence");
    ds_list_add(chat_messages, "being and nothingness and cookies");
    ds_list_add(chat_messages, "sartre would hate this");
    ds_list_add(chat_messages, "existentialists malding");
    ds_list_add(chat_messages, "philosophy majors in shambles");
    ds_list_add(chat_messages, "meanwhile cookies go brrrr");
    ds_list_add(chat_messages, "number printer go brrrr");
    ds_list_add(chat_messages, "dopamine machine activated");
    ds_list_add(chat_messages, "serotonin levels rising");
    ds_list_add(chat_messages, "brain chemistry altered");
    ds_list_add(chat_messages, "we're all addicts now");
    ds_list_add(chat_messages, "the first hit is free");
    ds_list_add(chat_messages, "then you need bigger numbers");
    ds_list_add(chat_messages, "always bigger numbers");
    ds_list_add(chat_messages, "until numbers lose all meaning");
    ds_list_add(chat_messages, "but you keep clicking anyway");
    ds_list_add(chat_messages, "because what else is there?");
    ds_list_add(chat_messages, "nothing but the click");
    ds_list_add(chat_messages, "click is life");
    ds_list_add(chat_messages, "click is love");
    ds_list_add(chat_messages, "shrek but with cookies");
    ds_list_add(chat_messages, "somebody once told me");
    ds_list_add(chat_messages, "cookies were gonna roll me");
    ds_list_add(chat_messages, "I ain't the sharpest tool in the shed");
    ds_list_add(chat_messages, "but I can click real good");
    ds_list_add(chat_messages, "clicking is my only talent");
    ds_list_add(chat_messages, "put that on your resume");
    ds_list_add(chat_messages, "professional cookie clicker");
    ds_list_add(chat_messages, "skills: clicking, more clicking");
    ds_list_add(chat_messages, "hobbies: guess");
    ds_list_add(chat_messages, "references: grandma");
    ds_list_add(chat_messages, "hired");
    ds_list_add(chat_messages, "the american dream");
    ds_list_add(chat_messages, "rags to riches through clicking");
    ds_list_add(chat_messages, "inspirational story");
    ds_list_add(chat_messages, "movie rights when?");
    ds_list_add(chat_messages, "netflix adaptation incoming");
    ds_list_add(chat_messages, "they'll probably ruin it");
    ds_list_add(chat_messages, "add unnecessary drama");
    ds_list_add(chat_messages, "cookie love triangle");
    ds_list_add(chat_messages, "romantic subplot with grandma");
    ds_list_add(chat_messages, "NO");
    ds_list_add(chat_messages, "some things are sacred");
    ds_list_add(chat_messages, "hollywood has no shame");
    ds_list_add(chat_messages, "they'd monetize breathing if they could");
    ds_list_add(chat_messages, "don't give them ideas");
    ds_list_add(chat_messages, "too late capitalism heard you");
    ds_list_add(chat_messages, "subscription based oxygen");
    ds_list_add(chat_messages, "breath premium only $9.99/month");
    ds_list_add(chat_messages, "includes 50% more oxygen molecules");
    ds_list_add(chat_messages, "and exclusive access to nitrogen");
    ds_list_add(chat_messages, "dystopian nightmare fuel");
    ds_list_add(chat_messages, "but at least we have cookies");
    ds_list_add(chat_messages, "cookies will save us");
    ds_list_add(chat_messages, "in cookies we trust");
    ds_list_add(chat_messages, "our sweet salvation");
    ds_list_add(chat_messages, "amen");
    ds_list_add(chat_messages, "can I get a hallelujah");
    ds_list_add(chat_messages, "HALLELUJAH");
    ds_list_add(chat_messages, "praise the cookie");
    ds_list_add(chat_messages, "blessed be the clicks");
    ds_list_add(chat_messages, "may your cookies multiply");
    ds_list_add(chat_messages, "and your grandmas be fruitful");
    ds_list_add(chat_messages, "in the name of the cookie the click and the holy granny");
    ds_list_add(chat_messages, "amen");
    ds_list_add(chat_messages, "this chat has ascended");
    ds_list_add(chat_messages, "we are become cookie destroyers of worlds");
    ds_list_add(chat_messages, "oppenheimer but tasty");
    ds_list_add(chat_messages, "now I am become baker destroyer of diets");
    ds_list_add(chat_messages, "the atomic cookie");
    ds_list_add(chat_messages, "splitting atoms into smaller cookies");
    ds_list_add(chat_messages, "nuclear fission powered bakery");
    ds_list_add(chat_messages, "science has gone too far");
    ds_list_add(chat_messages, "or not far enough");
    ds_list_add(chat_messages, "quantum cookies when?");
    ds_list_add(chat_messages, "cookies that exist in multiple states");
    ds_list_add(chat_messages, "schrodinger's cookie");
    ds_list_add(chat_messages, "simultaneously clicked and unclicked");
    ds_list_add(chat_messages, "until observed");
    ds_list_add(chat_messages, "then it becomes clicked");
    ds_list_add(chat_messages, "because we're always watching");
    ds_list_add(chat_messages, "always clicking");
    ds_list_add(chat_messages, "eternal vigilance");
    ds_list_add(chat_messages, "the price of cookies");
    ds_list_add(chat_messages, "worth it");
    ds_list_add(chat_messages, "totally worth it");
    ds_list_add(chat_messages, "no regrets");
    ds_list_add(chat_messages, "well maybe some regrets");
    ds_list_add(chat_messages, "but mostly cookies");
    ds_list_add(chat_messages, "cookies > regrets");
    ds_list_add(chat_messages, "mathematics checks out");
    ds_list_add(chat_messages, "science approved");
    ds_list_add(chat_messages, "peer reviewed by grandmas");
    ds_list_add(chat_messages, "grandma seal of approval");
    ds_list_add(chat_messages, "the highest honor");
    ds_list_add(chat_messages, "better than nobel prize");
    ds_list_add(chat_messages, "nobel prize for clicking when?");
    ds_list_add(chat_messages, "peace through cookies");
    ds_list_add(chat_messages, "world hunger solved");
    ds_list_add(chat_messages, "infinite cookies for everyone");
    ds_list_add(chat_messages, "utopia achieved");
    ds_list_add(chat_messages, "this is the good timeline");
    ds_list_add(chat_messages, "finally");
    ds_list_add(chat_messages, "took long enough");
    ds_list_add(chat_messages, "but we made it");
    ds_list_add(chat_messages, "together");
    ds_list_add(chat_messages, "through the power of clicking");
    ds_list_add(chat_messages, "and friendship");
    ds_list_add(chat_messages, "friendship is magic");
    ds_list_add(chat_messages, "cookies are friendship");
    ds_list_add(chat_messages, "therefore cookies are magic");
    ds_list_add(chat_messages, "QED");
    ds_list_add(chat_messages, "mathematical proof complete");
    ds_list_add(chat_messages, "no further questions your honor");
    ds_list_add(chat_messages, "case closed");
    ds_list_add(chat_messages, "cookies win");
    ds_list_add(chat_messages, "flawless victory");
    ds_list_add(chat_messages, "FATALITY");
    ds_list_add(chat_messages, "cookies always win");
    ds_list_add(chat_messages, "in the end");
    ds_list_add(chat_messages, "there will only be cookies");
    
    
    return chat_messages
}

function get_random_chat_message() {
    var list_size = ds_list_size(chat_messages);
    var random_index = irandom(list_size - 1);
    return ds_list_find_value(chat_messages, random_index);
}


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