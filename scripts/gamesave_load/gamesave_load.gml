function gamesave_load() {
  //gamesave_load();
  //loads the level the player was in.
  if (file_exists("ora_gamesave.sav")) {
    var _gs;
    _gs = adfile_open_read("ora_gamesave.sav");

    // Load the saved room:
    var _cur_room_name = adfile_read_string(_gs);
    var _cur_room_id = room_last;

    // Find current room based on its name:
    while (_cur_room_id != room_first) {
      if (room_get_name(_cur_room_id) == _cur_room_name) {
        break;
      }
      _cur_room_id = room_previous(_cur_room_id);
    }

    room_goto(_cur_room_id);

    // Move the player character
    global.xx = adfile_read_real(_gs);
    global.yy = adfile_read_real(_gs);

    global.loadgame = true;
    adfile_close(_gs);
  } else {
    room_goto_next();
  }
}
