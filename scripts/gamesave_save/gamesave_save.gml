function gamesave_save() {
  //gamesave_save();
  //saves various settings that the player assigned.
  var _gamesave;
  _gamesave = adfile_open_write("ora_gamesave.sav");

  //Room
  adfile_write_string(_gamesave, room_get_name(room));

  // Position
  adfile_write_real(_gamesave, global.xx);
  adfile_write_real(_gamesave, global.yy);

  //Close
  adfile_close(_gamesave);
}
