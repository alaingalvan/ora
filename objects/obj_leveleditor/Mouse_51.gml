var inviewport, inproperties;
inviewport = (mouse_x < 480 && mouse_y > 32 && !dropdown) || editorclosed;
inhierarchy = mouse_y < 544;
inproperties = mouse_y >= 544;

if (inviewport) {
  if (inhierarchy) {
    //Do something
  }
  if (inproperties) {
    //test
  }
}
if (!inviewport && mouse_y > 32) {
  //Can't place inside viewport
  colid = collision_point(select_x + 32, select_y + 32, all, true, true);
  //object_is_ancestor(colid, obj_ui_par)
  if (!object_is_ancestor(colid, obj_ui_par) && colid) {
    with (colid) {
      instance_destroy();
    }
  }
}
