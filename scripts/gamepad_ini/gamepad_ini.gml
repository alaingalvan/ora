function gamepad_ini() {
  //Gamepad
  for (var _i = 3; _i > -1; _i--) {
    global.gamepad_connected[_i] = gamepad_is_connected(i);
    global.camera_index[_i] = noone;
    global.gamepad_sensitivity_y[_i] = 1;
  }
}
