tag = choose("Roguelike", "Deckbuilder", "Idle Game", "Souls-like", "Horror", "Nudity", "Dark Humor", "Racing", "Violent", "Card Game", "Gambling", "Single Player", "Early Access", "Casual", "Strategy", "Puzzle", "Pixel Graphics", "Funny", "Relaxing", "Cosy")

caption = "Your game has met the requirements for the tag " + string(tag)

x = irandom(room_width)
y = irandom(room_height)


alarm[0] = 10 * game_get_speed(gamespeed_fps)

