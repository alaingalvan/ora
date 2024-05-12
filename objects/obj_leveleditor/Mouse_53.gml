var _in_viewport, _in_properties, _inhierarchy, _intopbar;
_in_viewport =
  (device_mouse_x_to_gui(0) < 480 &&
    device_mouse_y_to_gui(0) > 32 &&
    !dropdown) ||
  editorclosed;
_inhierarchy = device_mouse_y_to_gui(0) < 544;
_in_properties = device_mouse_y_to_gui(0) >= 544;
_intopbar = device_mouse_y_to_gui(0) < 32;
if (_intopbar) {
  if (device_mouse_x_to_gui(0) > 54 && device_mouse_x_to_gui(0) < 111) {
    if (!instance_exists(obj_oe_dropmenu_file)) {
      //instance_create(54, 32, obj_oe_dropmenu_file)
    }
  }
}
if (_in_viewport) {
  if (_inhierarchy) {
    if (hierarchyselect() >= 0) {
      if (hierarchyselect() < ds_grid_width(cur_list) - cur_line * line_width) {
        if (cur_x + cur_y * line_width == hierarchyselect()) {
          sel_x = hierarchyselect() % 3;
          sel_y = floor(hierarchyselect() / 3);
          cur_object = ds_grid_get(
            cur_list,
            hierarchyselect() + cur_line * line_width,
            0
          );
          if (is_string(cur_object)) {
            folder_goto(cur_object);
          }
        } else {
          cur_x = hierarchyselect() % 3;
          cur_y = floor(hierarchyselect() / 3);
        }
      }
    }
  }
  if (_in_properties) {
    //test
  }
}
