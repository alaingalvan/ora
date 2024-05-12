function res_preset_get() {
  //res_preset_get()
  if (global.aspect_ratio == 4 / 3) {
    if (
      global.res_x == display_get_width() &&
      global.res_y == display_get_height()
    ) {
      return 0;
    }
    if (global.res_x == 480 && global.res_y == 320) {
      return 1;
    }
    if (global.res_x == 640 && global.res_y == 480) {
      return 2;
    }
    if (global.res_x == 1024 && global.res_y == 768) {
      return 3;
    }
    if (global.res_x == 2048 && global.res_y == 1536) {
      return 4;
    }
  }
  if (global.aspect_ratio == 16 / 9) {
    if (
      global.res_x == display_get_width() &&
      global.res_y == display_get_height()
    ) {
      return 0;
    }
    if (global.res_x == 800 && global.res_y == 450) {
      return 1;
    }
    if (global.res_x == 1280 && global.res_y == 720) {
      return 2;
    }
    if (global.res_x == 1600 && global.res_y == 900) {
      return 3;
    }
    if (global.res_x == 1920 && global.res_y == 1080) {
      return 4;
    }
  }
  if (global.aspect_ratio == 16 / 10) {
    if (
      global.res_x == display_get_width() &&
      global.res_y == display_get_height()
    ) {
      return 0;
    }
    if (global.res_x == 1280 && global.res_y == 800) {
      return 1;
    }
    if (global.res_x == 1440 && global.res_y == 900) {
      return 2;
    }
    if (global.res_x == 1920 && global.res_y == 1200) {
      return 3;
    }
    if (global.res_x == 2560 && global.res_y == 1600) {
      return 4;
    }
  }

  return 0;
}
