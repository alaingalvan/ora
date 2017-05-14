/*
postprocess_blur(radius)
Creates a blur effect.
return surface s
*/
var r;
r = ((global.cam_distance-800)/80)
//r = 4
if r<=3
{r = 3}
//draw_surface_blur_ext(id,x,y,xscale,yscale,rot,color,alpha,blurradius)
draw_surface_blur_ext(obj_camera.view_surface_id[0],0,0,1,1,0,c_white,1,r)
