var inviewport, inproperties;
inviewport = (mouse_x < 480 && mouse_y > 32 && !dropdown) || editorclosed;
inhierarchy = mouse_y < 544;
inproperties = mouse_y >= 544;
intopbar = mouse_y < 32;
if (intopbar) {
  if (mouse_x > 54 && mouse_x < 111) {
    if (!instance_exists(obj_oe_dropmenu_file)) {
      //instance_create(54, 32, obj_oe_dropmenu_file)
    }
  }
}
if (inviewport) {
  if (inhierarchy) {
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
  if (inproperties) {
    //test
  }
}
