function mainmenu_sel_previous() {
  if (!trigger) {
    if (menu_type == 0) {
      if (cur_select - cur_line == 0 && cur_select != 0) {
        list_scroll_band += button_w + button_spacing;
      }
      cur_select = clamp(cur_select - 1, 0, ds_list_size(list) - 1);
    }

    if (menu_type == 1) {
      var size;
      size = ds_list_size(list);
      if (size > 7) {
        size = 7;
      }

      if (cur_select + cur_line < ds_list_size(list) - 1 && cur_select == 6) {
        cur_line += 1;
      }

      cur_select = clamp(cur_select - 1, 0, size - 1);
    }
    trigger = true;
    alarm[0] = room_speed / 5.0 / global.delta_fps;
  }
}
