if (!d3d_on) {
  select_x = floor(device_mouse_x_to_gui(0) / 64) * 64;
  select_y = floor(device_mouse_y_to_gui(0) / 64) * 64;
} else {
  convert_prepare(
    obj_camera.xfrom,
    obj_camera.yfrom,
    obj_camera.zfrom,
    obj_camera.xto,
    obj_camera.yto,
    obj_camera.zto,
    obj_camera.xup,
    obj_camera.yup,
    obj_camera.zup,
    obj_camera.fov,
    global.aspect_ratio
  );
  convert_2d(
    device_mouse_x_to_gui(0),
    device_mouse_y_to_gui(0),
    obj_camera.xfrom,
    obj_camera.yfrom,
    obj_camera.zfrom,
    0
  );
  select_x = floor(x_3d / 64) * 64;
  select_y = floor(y_3d / 64) * 64;
}
