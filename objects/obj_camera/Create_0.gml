/// @description Camera Ini
camera_ini();
//Shader Vars
//Blur
uniform_resolution = shader_get_sampler_index(shr_camera, "resolution");
sigma = shader_get_uniform(shr_camera, "sigma");
blur_size = shader_get_uniform(shr_camera, "blurSize");
blur_radius = 64.0;
blur_radius_band = blur_radius;
blur_spd = 1.0; // In Seconds
blur_active = false; //True = fade to band, false = fade to 0.

//Color Correction
color_curve = shader_get_sampler_index(shr_camera, "texCurve");
vignette = shader_get_sampler_index(shr_camera, "texVignette");
