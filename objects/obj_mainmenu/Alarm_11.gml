/// @description Mobile Specific Settings
if (os_type == os_android)
{
    global.res_x = display_get_width();
    global.res_y = display_get_height();
    global.aspect_ratio = (global.res_x/global.res_y);
}
config_load();
config_apply();
io_clear();

