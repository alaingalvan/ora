/// @description Camera Ini
camera_ini();
//Shader Vars
blur_radius = 64.0;
blur_radius_band = blur_radius;
blur_spd = 1.0; // In Seconds
blur_active = false; //True = fade to band, false = fade to 0.

if (shader_is_compiled(sh_camera)) {
  uniform_resolution = shader_get_sampler_index(sh_camera, "resolution");
  sigma = shader_get_uniform(sh_camera, "sigma");
  blur_size = shader_get_uniform(sh_camera, "blurSize");

  //Color Correction
  color_curve = shader_get_sampler_index(sh_camera, "texCurve");
  vignette = shader_get_sampler_index(sh_camera, "texVignette");
}
