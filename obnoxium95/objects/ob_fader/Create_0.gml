if (!variable_instance_exists(id, "fadeStatus")) {
    fadeStatus = 1; // Only set if not already set
}

show_debug_message(fadeStatus)
image_alpha = fadeStatus

diff = 0.03
depth = -200000


