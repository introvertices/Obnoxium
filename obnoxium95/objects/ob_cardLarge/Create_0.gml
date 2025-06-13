image_speed = 0

//distribute stats

cardnum = irandom_range(1,13)
cardsymbol = irandom_range(1,4)


// status
flipped = false
burn = false
burnalpha = 1

// type
if (!variable_instance_exists(id, "card_name")) {
    card_name = "null"; // Only set if not already set
}