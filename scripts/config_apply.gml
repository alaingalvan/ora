if (room != men_main)
{
    for (i = 0; i < 3; i += 1)
    {
        view_wview[i] = window_get_width();
        view_hview[i] = window_get_height();
        view_wport[i] = window_get_width();
        view_hport[i] = window_get_height();
    }
}

if (room == men_main)
{
    view_wport = global.res_x;
    view_hport = global.res_y;
    view_xport = 0;
    view_yport = 0;
    var ar, arc;
    arc = 16 / 10;
    ar= abs(global.aspect_ratio - arc);
    if (ar < 0.1) //16:10
    {
        view_xview = 0;
        view_yview = 0;
        view_wview = 1920;
        view_hview = 1200;
    }

    arc = 16 / 9;
    ar= abs(global.aspect_ratio - arc);
    if (ar < 0.1) //16:9
    {
        view_xview = 0;
        view_yview = 120;
        view_wview = 1920;
        view_hview = 1080;
    }
    arc = 4 / 3;
    ar= abs(global.aspect_ratio - arc);
    if (ar < 0.1) //4:3
    {
        view_xview = 160;
        view_yview = 0;
        view_wview = 1600;
        view_hview = 1200;
    }

}
window_set_rectangle(0, 0, global.res_x, global.res_y);
display_reset(global.antialiasing, global.vsync);
window_set_fullscreen(global.fullscreen);
window_center();

room_speed = global.framelimit;
gamepad_detect();
//io_clear()
