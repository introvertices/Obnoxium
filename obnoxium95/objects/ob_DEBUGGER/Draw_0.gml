draw_set_color(c_white)
draw_text(32,35,string(global.playerAtk) + " Atk")
draw_text(32,55,string(global.playerHP) + " HP")
draw_text(32,75,string(global.playerSin) + " Sin | " + string(global.playerDodge) + "% Dodge")

draw_text(32,90,"Last hits:")
for (var i = 0; i < array_length(lastHits); i++){
    draw_text(32,110+ (25 * i),lastHits[i])
}