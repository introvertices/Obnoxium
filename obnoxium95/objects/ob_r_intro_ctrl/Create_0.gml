cardsFlipped = 0
dialogueHide = false
playerQuality = 0
concatStats = ""

// Room dialogue

jSpeechIntro = [
    "Oooh, what do we have here! A fated wanderer into my completely above board and not roach infested casino?! Lucky lucky day - for me!",
    "I can tell from the eager glint in your eyes you DESPERATELY want to play, but hold your racehorses!",
    "I can't let the, uh, actual MEAT version of you play due to certain contracts I have in place with fellows much lowe- I MEAN HIGHER than me...",
    "Buuuuut *pokes you with a rusty nail* with a little blood I can create a little poppet that can have fun in your stead. You're up to date on Tetanus shots... right?",
    "Each card here will imbue your little one with power - Health, Fighting Ability, and Inherited Sin. Yep, sorry, but the art of manifesting life does require a little punishment! House rules!",
    "Go ahead, flip out!"

]

jSpeechResults = [
    "Hmm let's see here...",
    "Yeah yeah, still working on the effects, I'm on time constraints here!"
]

instance_create_layer(0,0,"dialogue",ob_r_intro_dialogue,{dialogueTree:jSpeechIntro, head:sp_bigTalkingHead})