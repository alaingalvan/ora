//res_preset_set(preset)
switch (global.aspect_ratio)
{
case (4/3): //4:3
    switch (argument0)
    {
    case 0:
    //Auto
    if ((display_get_width()/display_get_height()) == (4 / 3))
    {
        global.res_x = display_get_width();
        global.res_y = display_get_height();
    }
    else
    {
        res_preset_set(1);
    }
    break;
    case 1:
    //480:320
    global.res_x = 480;
    global.res_y = 320;
    break;
    case 2:
    //640:480
    global.res_x = 640;
    global.res_y = 480;
    break;
    case 3:
    //1024:768
    global.res_x = 1024;
    global.res_y = 768;
    break;
    case 4:
    //1024:768
    global.res_x = 2048;
    global.res_y = 1536;
    break;
    }
break;
case (16/9): //16:9
    switch (argument0)
    {
    case 0:
    //Auto
    if ((display_get_width()/display_get_height()) == (16 / 9))
    {
        global.res_x = display_get_width();
        global.res_y = display_get_height();
    }
    else
    {
        res_preset_set(1);
    }
    break;
    case 1:
    //720:480 (480p)
    global.res_x = 800;
    global.res_y = 450;
    break;
    case 2:
    //1280x720 (720p)
    global.res_x = 1280;
    global.res_y = 720;
    break;
    case 3:
    //1600x900 (1080p)
    global.res_x = 1600;
    global.res_y = 900;
    break;
    case 4:
    //1920x1080 (1080p)
    global.res_x = 1920;
    global.res_y = 1080;
    break;
    }
break;
case (16/10): //16:10
    switch (argument0)
    {
    case 0:
    //Auto
    if ((display_get_width()/display_get_height()) == (16 / 10))
    {
        global.res_x = display_get_width();
        global.res_y = display_get_height();
    }
    else
    {
        res_preset_set(1);
    }
    break;
    case 1:
    //1280x800
    global.res_x = 1280;
    global.res_y = 800;
    break;
    case 2:
    //1440x900
    global.res_x = 1440;
    global.res_y = 900;
    break;
    case 3:
    //1920x1200
    global.res_x = 1920;
    global.res_y = 1200;
    break;
    case 4:
    //2560x1600
    global.res_x = 2560;
    global.res_y = 1600;
    break;
    }
break;
}
