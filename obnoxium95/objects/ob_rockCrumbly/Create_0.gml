if (!variable_instance_exists(id, "hp")) {
    hp = 16 // Only set if not already set
}

show_hp = false

if !place_snapped(32, 32)
    {
        move_snap(32, 32);
    }