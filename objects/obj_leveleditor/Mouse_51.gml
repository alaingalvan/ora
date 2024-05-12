var _inviewport, _inproperties;
_inviewport = (mouse_x < 480 && mouse_y > 32 && !dropdown) || editorclosed;
inhierarchy = mouse_y < 544;
_inproperties = mouse_y >= 544;

if (_inviewport) {
  if (inhierarchy) {
    //Do something
  }
  if (_inproperties) {
    //test
  }
}
if (!_inviewport && mouse_y > 32) {
  //Can't place inside viewport
  colid = collision_point(select_x + 32, select_y + 32, all, true, true);
  if (instance_exists(colid)) {
    var _obj_index = colid.object_index;
    if (!object_is_ancestor(_obj_index, obj_ui_par) && colid) {
      with (colid) {
        instance_destroy();
      }
    }
  }
}
