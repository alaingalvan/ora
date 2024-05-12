var _inviewport, _inproperties, _inhierarchy;
_inviewport =
  (device_mouse_x_to_gui(0) < 480 &&
    device_mouse_y_to_gui(0) > 32 &&
    !dropdown) ||
  editorclosed;
_inhierarchy = mouse_y < 544;
_inproperties = mouse_y >= 544;

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
  var _colid = collision_point(select_x + 32, select_y + 32, all, true, true);
  if (instance_exists(_colid)) {
    var _obj_index = _colid.object_index;
    if (!object_is_ancestor(_obj_index, obj_ui_par) && colid) {
      with (_colid) {
        instance_destroy();
      }
    }
  }
}
