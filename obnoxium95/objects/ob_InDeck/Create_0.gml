




if (ob_deckbuild.deckSizeHidden< 5){
    
    card = get_random_card()
    parsed = parse_card_data(card.data)
    ob_deckbuild.xMove -= (sprite_get_width(sp_cardBlood)+15)
    
    ob_deckbuild.deckSize = choose("IT DOESN'T MATTER", "WHO CARES", "STEAM TAG UNLOCKED!!", "ROGUELIKE WHERE??")
    ob_deckbuild.deckSizeHidden += 1
    
}

