/*
postprocess_tint(layer)
Creates tint effect on viewport, then returns a surface. 
return surface s
*/
var r;
r = ((global.cam_distance-810)/80)
if r<0
{
r = 0
}
draw_surface_ext(obj_camera.view_surface_id[0],0,0,1,1.00,0,make_color_rgb(255,0,0),1)
draw_set_blend_mode_ext(bm_dest_alpha,bm_one)
draw_surface_ext(obj_camera.view_surface_id[0],0,0,1.00,1,0,make_color_rgb(0,255,0),r)
draw_set_blend_mode_ext(bm_dest_alpha,bm_one)
draw_surface_ext(obj_camera.view_surface_id[0],0,0,1,1,0,make_color_rgb(0,0,255),1)
draw_set_blend_mode(bm_normal)

