ww = 25; //Width of the "ring" effect
radius = 0; //Size check variable
r_max = 120; //Maximum radius of the effect
spd = 1; //Expansion speed
d = 360 / 15; //Ring "segments" to be drawn
z = 0;

//get the texture components from the surface
if (instance_exists(obj_camera)) {
  tex = surface_get_texture(obj_camera.view_surface[0]);
  srf_w = surface_get_width(obj_camera.view_surface[0]);
  srf_h = surface_get_height(obj_camera.view_surface[0]);
  tex_w = texture_get_width(tex);
  tex_h = texture_get_height(tex);
} else instance_destroy();

/*
z = 0
convert_prepare(global.cam_xfrom,global.cam_yfrom,global.cam_zfrom,global.cam_xto,global.cam_yto,global.cam_zto,global.cam_up_x,global.cam_up_y,global.cam_up_z,global.cam_fov,window_get_width()/window_get_height());
// Create the animation variables for the relic
relic_rx = 0;
relic_hover = 0;
// Create circle model pieces
circle_model1 = d3d_model_create();
circle_model2 = d3d_model_create();
pi180 = (pi/180)
light_animate = 0;
s = 0;

/* */
/*  */
