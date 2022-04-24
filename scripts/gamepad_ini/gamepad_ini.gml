function gamepad_ini() {
	//Gamepad
	for (var i = 3; i > -1; i--;) {
	  global.gamepad_connected[i] = gamepad_is_connected(i);
	  global.camera_index[i] = noone;
	}



}
