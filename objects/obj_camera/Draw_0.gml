/// @description Camera Draw
camera_draw();

if (global.postprocessing)
{
if (!surface_exists(cam_surface))
{
    cam_surface = surface_create(global.res_x, global.res_y);
    surface_set_target(cam_surface);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
    __view_set( e__VW.SurfaceID, 0, cam_surface );
}
}

