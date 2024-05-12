var _inviewport, _inproperties, _inhierarchy;
_inviewport =
  (device_mouse_x_to_gui(0) < 480 &&
    device_mouse_y_to_gui(0) > 32 &&
    !dropdown) ||
  editorclosed;
_inhierarchy = device_mouse_y_to_gui(0) < 544;
_inproperties = device_mouse_y_to_gui(0) >= 544;

if (_inviewport) {
  if (_inhierarchy) {
    //Do something
  }
  if (_inproperties) {
    //test
  }
}
if (!_inviewport && device_mouse_y_to_gui(0) > 32) {
  //Can't place inside viewport
  if (
    !is_string(cur_object) &&
    (place_empty(select_x, select_y) || placeover)
  ) {
    instance_create(select_x, select_y, cur_object);
  }
}
