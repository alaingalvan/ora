function config_apply() {
  if (room != men_main) {
    for (i = 0; i < 3; i += 1) {
      __view_set(e__VW.WView, i, window_get_width());
      __view_set(e__VW.HView, i, window_get_height());
      __view_set(e__VW.WPort, i, window_get_width());
      __view_set(e__VW.HPort, i, window_get_height());
    }
  }

  if (room == men_main) {
    __view_set(e__VW.WPort, 0, global.res_x);
    __view_set(e__VW.HPort, 0, global.res_y);
    __view_set(e__VW.XPort, 0, 0);
    __view_set(e__VW.YPort, 0, 0);
    var ar, arc;
    arc = 16 / 10;
    ar = abs(global.aspect_ratio - arc);
    if (ar < 0.1) {
      //16:10
      __view_set(e__VW.XView, 0, 0);
      __view_set(e__VW.YView, 0, 0);
      __view_set(e__VW.WView, 0, 1920);
      __view_set(e__VW.HView, 0, 1200);
    }

    arc = 16 / 9;
    ar = abs(global.aspect_ratio - arc);
    if (ar < 0.1) {
      //16:9
      __view_set(e__VW.XView, 0, 0);
      __view_set(e__VW.YView, 0, 120);
      __view_set(e__VW.WView, 0, 1920);
      __view_set(e__VW.HView, 0, 1080);
    }
    arc = 4 / 3;
    ar = abs(global.aspect_ratio - arc);
    if (ar < 0.1) {
      //4:3
      __view_set(e__VW.XView, 0, 160);
      __view_set(e__VW.YView, 0, 0);
      __view_set(e__VW.WView, 0, 1600);
      __view_set(e__VW.HView, 0, 1200);
    }
  }

  if (os_type == os_android) {
    global.res_x = display_get_width();
    global.res_y = display_get_height();
  }

  global.aspect_ratio = global.res_y / global.res_x;

  window_set_rectangle(0, 0, global.res_x, global.res_y);
  display_reset(global.antialiasing, global.vsync);
  window_set_fullscreen(global.fullscreen);
  window_center();

  room_speed = global.framelimit;
  gamepad_detect();
}
