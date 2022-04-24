/// @description Camera Update
camera_update();

///Camera Input

//Screenshot
if (keyboard_check_released(vk_f12))
{
    //screenshot_save();
}

//Fullscreen
if (keyboard_check_released(vk_f11))
{
    if (!(os_type == os_android || os_type == os_ios))
    {
        if (window_get_fullscreen())
        {
        global.fullscreen = false;
        config_save();
        config_apply();
        }
        else
        {
        global.fullscreen = true;
        config_save();
        config_apply();
        }
    }
}

//Escape
if (keyboard_check_released(vk_escape))
{
    menu_goto();
}

///Misc
if (keyboard_check_released(192) && room != men_main) {
  if (instance_exists(obj_console)) {
    with(obj_console) {
      instance_destroy();
    }

  } else {
    instance_create(0, window_get_height(), obj_console);
  }
}

////////////////////////////////////////////////////////////////////////////////////////
//Shader Calculations
////////////////////////////////////////////////////////////////////////////////////////
//Blur
band = (blur_spd / (delta_time / 1000000.0));
if (band > 1) {
  if (blur_active) {
    blur_radius += (blur_radius_band - blur_radius) / band;
  } else {
    blur_radius += (0.0 - blur_radius) / band;
  }
} else {
  if (blur_active) {
    blur_radius = blur_radius_band;
  } else {
    blur_radius = 0.0;
  }
}

