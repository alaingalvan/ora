if (gamepad_is_supported()) {
    var gp_num = gamepad_get_device_count();
    for (var i = 0; i < gp_num; i++) {
        if (gamepad_is_connected(i)) {
            global.gamepad_connected[i] = true;
        } else {
            global.gamepad_connected[i] = false;
        }
    }
}
