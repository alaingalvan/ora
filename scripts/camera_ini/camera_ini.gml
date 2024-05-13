function camera_ini() {
  /*camera_ini()
    //By Alain Galvan
    //Last Revision: 06/26/13
    ////////////////////////////////////////////////////////////////////////////////////////
    Initialize Code
    ////////////////////////////////////////////////////////////////////////////////////////
    This script initializes the camera and all the variables needed in the camera. 
    //////////////////////////////////////////////////////////////////////////////////////*/
  config_apply();

  if (os_browser != browser_not_a_browser) {
    gpu_set_zwriteenable(true);
    gpu_set_ztestenable(true);
    gpu_set_zfunc(cmpfunc_lessequal);
    gpu_set_cullmode(cull_noculling);
    gpu_set_alphatestenable(true);
  }

  d3d_start();
  d3d_set_shading();
  d3d_set_lighting(false);
  draw_set_color(c_white);
  texture_set_interpolation(true);
  texture_set_blending(true);
  d3d_set_culling(false);

  d3d_light_define_ambient(c_white);

  //Location
  //x = 0;
  //y = 0;
  z = 0;

  //Cam Angle / Distance / FOV
  angle_x = 270;
  angle_y = 90;
  distance = 800;
  fov = 45;
  angle_xprevious = angle_x;
  angle_yprevious = angle_y;
  rotating = false;
  panning = false;

  rotate_spd_y = 1 / 3; //Unit in Sec
  rotate_spd_x = 1 / 3;
  distance_spd = 1.5;
  fov_spd = 1;

  //Banding
  angle_x_band = angle_x;
  angle_y_band = angle_y;
  distance_band = distance;
  fov_band = fov;

  //Previous
  prev_angle_x = angle_x;
  prev_angle_y = angle_y;

  //Cam Translate
  xto = x;
  yto = y;
  zto = z;

  xto_spd = 1 / 3;
  yto_spd = 1 / 3;
  zto_spd = 1 / 3;

  xfrom = xto + cos(angle_x * pi180) * cos(angle_y * pi180) * distance;
  yfrom = yto - sin(angle_x * pi180) * cos(angle_y * pi180) * distance;
  zfrom = zto + sin(angle_y * pi180) * distance;

  //Up vector
  xup = 0;
  yup = 0;
  zup = 1;

  zfar = 10000;

  //Camera Surface
  cam_surface = -1;

  //For moving the camera in the viewport.
  cam_xport = 0;
  cam_yport = 0;
  aspect_ratio = 1.0 / global.aspect_ratio;

  global.mb_middle_event_x = mouse_x;
  global.mb_middle_event_y = mouse_y;

  player_exists = false;
  global.camera_index[0] = id;
}
