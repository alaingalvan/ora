/// @description Camera Surface Draw
if (global.postprocessing) {
  //Draw View
  shader_set(sh_camera);
  ////////////////////////////////////////////////////////////////////////////////////////
  //Blur
  shader_set_uniform_f(sigma, blur_radius);
  shader_set_uniform_f(blur_size, 1.0 / global.res_x);
  ////////////////////////////////////////////////////////////////////////////////////////
  //Color Correction
  texture_set_stage(color_curve, background_get_texture(bac_colorcurve));
  texture_set_stage(vignette, background_get_texture(bac_sfx_light0));
  ////////////////////////////////////////////////////////////////////////////////////////
  draw_surface(__view_get(e__VW.SurfaceID, 0), cam_xport, cam_yport);
  shader_reset();
}
