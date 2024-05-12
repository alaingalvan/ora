scale = 1920 / window_get_width();
if (os_type != os_android || os_type != os_ios) {
  if (window_get_fullscreen()) {
    window_set_fullscreen(false);
    window_set_rectangle(0, 0, window_get_width(), window_get_height());
    for (i = 0; i < 3; i += 1) {
      __view_set(e__VW.WView, i, window_get_width());
      __view_set(e__VW.HView, i, window_get_height());
      __view_set(e__VW.WPort, i, window_get_width());
      __view_set(e__VW.HPort, i, window_get_height());
    }
  } else {
    window_set_fullscreen(true);
    window_set_rectangle(0, 0, display_get_width(), display_get_height());
    for (i = 0; i < 3; i += 1) {
      __view_set(e__VW.WView, i, window_get_width());
      __view_set(e__VW.HView, i, window_get_height());
      __view_set(e__VW.WPort, i, window_get_width());
      __view_set(e__VW.HPort, i, window_get_height());
    }
  }
}
