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
  if (
    !is_string(cur_object) &&
    (place_empty(select_x, select_y) || placeover)
  ) {
    instance_create(select_x, select_y, cur_object);
  }
}
