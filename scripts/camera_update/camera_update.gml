function camera_update() {
  //camera_update()
  ////////////////////////////////////////////////////////////////////////////////////////
  //Input
  ////////////////////////////////////////////////////////////////////////////////////////
  var target_x, target_y, target_z, target_exists;

  if (!global.cutscene) {
    if (instance_exists(obj_orb)) {
      //Follow Ora
      x = obj_orb.x + 128;
      y = obj_orb.y + 128;
      z = obj_orb.z;
      distance_band = 800 + 1 + ((12 * abs(obj_orb.Speed)) ^ 4);
      //Mouse based Camera Control
      if (rotating && global.debug) {
        angle_x_band =
          prev_angle_x +
          (mouse_x - global.mb_middle_event_x) * global.mouse_sensitivity_x;
        if (prev_angle_y >= -90 && prev_angle_y <= 90) {
          angle_y_band =
            prev_angle_y +
            (mouse_y - global.mb_middle_event_y) * global.mouse_sensitivity_y;
        }
      }
      //Gamepad based Camera Control
      var controller;
      controller = gamepad_is_supported() && global.gamepad_connected[0];
      if (controller) {
        var rightstick_x, rightstick_y, looking;
        rightstick_x = gamepad_axis_value(0, gp_axisrh);
        rightstick_y = gamepad_axis_value(0, gp_axisrv);
        looking =
          abs(rightstick_x) > global.gamepad_deadzone[0] ||
          abs(rightstick_y) > global.gamepad_deadzone[0];

        if (looking) {
          angle_x_band +=
            ((rightstick_x - global.gamepad_deadzone[0]) /
              (1 - global.gamepad_deadzone[0])) *
            global.gamepad_sensitivity_y[0];
          angle_y_band +=
            ((rightstick_y - global.gamepad_deadzone[0]) /
              (1 - global.gamepad_deadzone[0])) *
            global.gamepad_sensitivity_y[0];
        }
      }
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////
  //Camera Banding Calc
  ////////////////////////////////////////////////////////////////////////////////////////
  //Banding
  var band;

  band = distance_spd / (delta_time / 1000000.0);
  if (band > 1) {
    distance += (distance_band - distance) / band;
  } else {
    distance = distance_band;
  }

  band = xto_spd / (delta_time / 1000000.0);
  if (band > 1) {
    xto += (x - xto) / band;
  } else {
    xto = x;
  }

  band = yto_spd / (delta_time / 1000000.0);
  if (band > 1) {
    yto += (y - yto) / band;
  } else {
    yto = y;
  }

  band = zto_spd / (delta_time / 1000000.0);
  if (band > 1) {
    zto += (z - zto) / band;
  } else {
    zto = z;
  }

  band = rotate_spd_x / (delta_time / 1000000.0);
  if (band > 1) {
    angle_x += (angle_x_band - angle_x) / band;
  } else {
    angle_x = angle_x_band;
  }

  band = rotate_spd_y / (delta_time / 1000000.0);
  if (band > 1) {
    angle_y += (angle_y_band - angle_y) / band;
  } else {
    angle_y = angle_y_band;
  }

  band = fov_spd / (delta_time / 1000000.0);
  if (band > 1) {
    fov += (fov_band - fov) / band;
  } else {
    fov = fov_band;
  }

  ////////////////////////////////////////////////////////////////////////////////////////
  //Camera Calculations
  ////////////////////////////////////////////////////////////////////////////////////////
  //Keeps cam angle y between 90 and 270
  angle_y_band = median(-90, angle_y_band, 90);
  angle_y = median(-90, angle_y, 90);

  //Keeps distance to a minimum of 1 units
  if (distance < 1) {
    distance = 1;
  }

  //Cam From Calculations (Object pointed at) + (spherical coordinates * distance from object)
  xfrom = xto + cos(angle_x * pi180) * cos(angle_y * pi180) * distance;
  yfrom = yto - sin(angle_x * pi180) * cos(angle_y * pi180) * distance;
  zfrom = zto + sin(angle_y * pi180) * distance;

  var vec_up, aa;
  aa = angle_y;
  if (aa >= 45 || aa <= -45) {
    aa = -angle_y;
  }

  xup = lengthdir_x(lengthdir_x(1, aa - 90), angle_x);
  yup = lengthdir_y(lengthdir_x(1, aa - 90), angle_x);
  zup = lengthdir_y(1, aa - 90);
}
