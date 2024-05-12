function aspect_preset_get() {
  //aspect_preset_set(set);
  //Input an int, and returns a new aspect ratio.
  var _aspect_preset = 1;
  switch (global.aspect_ratio) {
    case 4 / 3:
      _aspect_preset = 0;
      break;
    case 16 / 9:
      _aspect_preset = 1;
      break;
    case 16 / 10:
      _aspect_preset = 2;
      break;
    default:
      _aspect_preset = 1;
      break;
  }

  return _aspect_preset;
}
