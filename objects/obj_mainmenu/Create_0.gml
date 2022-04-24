/// @description Menu Start
game_ini();
scale = 1920 / 1280;
if (os_type == os_android)
{
    scale=1920 / 1196;
}

//Button Params
button_c[0] = c_black;
button_c[1] = make_color_rgb(48, 48, 48);
button_w = 224;
button_h = 96;
button_spacing = 32;
button_y = (800 / 2) + 272;
button_y_max = 16;
button_maxnumber = 24;

for (var i = 10; i > -1; i--)
{
    button_y_add[i] = 0;
}


//Fade in / Fade Out Transition effect for menu folders. 
trans_alpha = 1.0;
trans_menu = false;

//Menu
menu_type = 0; //0 = Buttons, 1 = List
mneu_type_next = 0;
list_w = 3; //Number of instances shown
cur_select = 0; //Current menu button. (index)
selection_confirmed = -1;
trigger = false; //For action.
pre_menu = "";
cur_menu = "";
next_menu = "";
cur_line = 0;
list_scroll = 0;
list_scroll_band = 0;

mb_left_event_x = mouse_x;
mb_left_event_y = mouse_y;
mouse_dragging = false;

//mouse_tapping = true;
list_scroll_previous = 0;

list = ds_list_create();
mainmenu_goto("");
io_clear();

//Mobile Specific Start
alarm[11] = 1;
if (os_type == os_android)
{
    global.res_x = display_get_width();
    global.res_y = display_get_height();
    global.aspect_ratio = (global.res_x/global.res_y);
}

