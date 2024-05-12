if (!d3d_on) {
  select_x = floor(mouse_x / 64) * 64;
  select_y = floor(mouse_y / 64) * 64;
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
    mouse_x,
    mouse_y,
    obj_camera.xfrom,
    obj_camera.yfrom,
    obj_camera.zfrom,
    0
  );
  select_x = floor(x_3d / 64) * 64;
  select_y = floor(y_3d / 64) * 64;
}
