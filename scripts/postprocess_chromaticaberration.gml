/*
postprocess_chromaticaberration()
Creates chromatic aberration effect on viewport, then returns a surface. 
return surface s
*/
var v,vx,r;
r = ((global.cam_distance-810)/80)
v = (sqrt(3)/2)*(r)
vx = 0.5*(r)
draw_surface_ext(obj_camera.view_surface_id[0],0-vx,0+(v/2),1,1.00,0,make_color_rgb(255,0,0),1)
draw_set_blend_mode_ext(bm_dest_alpha,bm_one)
draw_surface_ext(obj_camera.view_surface_id[0],0+vx,0+(v/2),1.00,1,0,make_color_rgb(0,255,0),1)
draw_set_blend_mode_ext(bm_dest_alpha,bm_one)
draw_surface_ext(obj_camera.view_surface_id[0],0,0-v,1,1,0,make_color_rgb(0,0,255),1)
draw_set_blend_mode(bm_normal)

