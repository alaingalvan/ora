function game_presets_string() {
  //Returns a string defining what the current preset is.
  //-1 = custom, 0 = minimum, 1 = low, 2 = medium, 3 = high, 4 = maximum.
  var _a;
  _a = game_presets_get();
  if (_a == -1) {
    return "Custom";
  }
  return _a;
}
