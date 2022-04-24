/// @description Graphical Changes

//Button Y Changes
var vel, xx;
vel = 3.75 * (delta_time/1000000);
//vel = (3.75 / room_speed) * global.delta_fps;
if (cur_select >= 0)
{
    if (button_y_add[cur_select] < button_y_max)
    {
        button_y_add[cur_select] = clamp(0.0, (button_y_add[cur_select] + vel), 1.0);
    }
}

for (var a = ds_list_size(list) - 1; a > -1; a--)
{
    if (a != cur_select)
    {
        if (button_y_add[a] > 0.0)
        {
            button_y_add[a] = clamp(0.0, (button_y_add[a] - vel), button_y_max);
        }
    }
}

//Scrolling
var band;
band = (0.2 * (room_speed / global.delta_fps));

if (band > 1.0)
{
    list_scroll += (list_scroll_band - list_scroll) / band;
}
else
{
    list_scroll = list_scroll_band;
}

cur_line = ceil(-list_scroll_band / ((button_w) + (button_spacing)));


//Borders
if (list_scroll > 0.0 && cur_line <= 0)
{
    list_scroll_band = 0.0;
}

if (cur_line > ds_list_size(list) - list_w)
{
    list_scroll_band = -(ds_list_size(list) - list_w) * (button_w + button_spacing);
}

//Transitions
if (trans_menu)
{
    trans_alpha -= (3.0 / room_speed) * global.delta_fps;
    if (trans_alpha <= 0)
    {
        trans_menu = false;
        pre_menu = cur_menu;
        cur_menu = next_menu;
        cur_line = 0;
        list_scroll_band = 0;
        list_scroll = 0;
        cur_select = 0;
        mainmenu_goto(cur_menu);
        menu_type = menu_type_next;
    }
}
else
{
    trans_alpha += (3.0 / room_speed) * global.delta_fps;
}

trans_alpha = clamp(trans_alpha, 0.0, 1.0);

///Mouse Input
var xx, inregion, s;
s = (__view_get( e__VW.WView, 0 ) / 1280);
if (menu_type == 0)
{
    //Perform Actions on Current Instance
    for (var a = 0; a < ds_list_size(list); a++)
    {
        xx = (1280 / 2) - 192 + (button_w * a) + (button_spacing * a) + list_scroll;
        inregion = (mouse_x > xx * s and mouse_x < (xx + button_w) * s && mouse_y > (button_y - button_y_add[a]) * s && mouse_y < (button_y + button_h) * s);

        if (inregion)
        {
        cur_select = a;
        }
        
        if (mouse_check_button_released(mb_left))
        {
            if (inregion)
            {
                if (selection_confirmed == a && !mouse_dragging)
                {
                    mainmenu_action(ds_list_find_value(list, selection_confirmed));
                }
                else
                {
                    selection_confirmed = a;
                }
            }
        }
    }
    if (mouse_wheel_down())
    {
        list_scroll_band -= ((button_w) + (button_spacing));
    }
    if (mouse_wheel_up())
    {
        list_scroll_band += ((button_w) + (button_spacing));
    }
}

if (menu_type == 1)
{
    for (var i = 0; i < ds_list_size(list); i += 1)
    {
        xx = (1280 / 2) + 256 + 32;
        inregion = mouse_x > xx * s and mouse_x < (1280) * s and mouse_y > (192 + ((i - 0.5) * 64)) * s and mouse_y < (192 + ((i + 0.5) * 64)) * s;
        if (inregion)
        {
            if (mouse_check_button_pressed(mb_left))
            {
                if (cur_select != i)
                {
                    cur_select = i;
                }
                else
                {
                    mainmenu_action(ds_list_find_value(list, i));
                    var txt, data;
                    txt = ds_list_find_value(list, i + cur_line);
                    data = mainmenu_data(txt);
                    if (data != "")
                    {
                        if (mouse_x > ((1152 - 32 - 16) * s) && mouse_x < ((1152 - 32 + 16) * s))
                        {
                            mainmenu_data_previous(txt);
                        }
                        if (mouse_x > ((1280 - 16 - 16) * s) && mouse_x < ((1280) * s))
                        {
                            mainmenu_data_next(txt);
                        }
                    }
                }
            }
        }
    }
    if (mouse_wheel_down())
    {
        mainmenu_sel_next();
    }
    if (mouse_wheel_up())
    {
        mainmenu_sel_previous();
    }
}

///Touchscreen Input
if (mouse_check_button_pressed(mb_left))
{
    mb_left_event_x = mouse_x;
    mb_left_event_y = mouse_y;
    list_scroll_previous = list_scroll;
}
if (mouse_check_button_released(mb_left))
{
    mouse_dragging = false;
}

if (mouse_check_button(mb_left))
{
    var xmin, xmax, s;
    xmin = (1280 / 2) - 192 + (button_w * 0) + (button_spacing * 0) - 64;
    xmax = (1280 / 2) - 192 + (button_w * 3) + (button_spacing * 3) + 64;
    s = (__view_get( e__VW.WView, 0 ) / 1280);
    
    var inregion;
    inregion = (mouse_y > (button_y - button_y_max) * s && mouse_y < (button_y + button_h) * s && mouse_x > xmin * s && mouse_x < xmax * s);
    
    if (inregion)
    {
        if (abs(mouse_y - mb_left_event_y) > 2.0 || abs(mouse_x - mb_left_event_x) > 2.0)
        {
            mouse_dragging = true;
        }
    }
}

if (mouse_dragging)
{
    list_scroll_band = list_scroll_previous + (mb_left_event_x - mouse_x);
}

///Keyboard Input
if (menu_type == 0)
{
    if (keyboard_check(vk_left))
    {
        mainmenu_sel_previous();
    }
    if (keyboard_check(vk_right))
    {
        mainmenu_sel_next();
    }
}
if (menu_type == 1)
{
    if (keyboard_check(vk_up))
    {
        mainmenu_sel_previous();
    }
    if (keyboard_check(vk_down))
    {
        mainmenu_sel_next();
    }
    if (keyboard_check(vk_left))
    {
        mainmenu_data_previous(ds_list_find_value(list, cur_select + cur_line));
    }
    if (keyboard_check(vk_right))
    {
        mainmenu_data_next(ds_list_find_value(list, cur_select + cur_line));
    }
}
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(ord("X")))
{
    mainmenu_action("back");
}

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))
{
    mainmenu_action(ds_list_find_value(list, cur_select));
}

///Controller based Input
if (gamepad_is_supported())
{
    //gamepad_detect();

    if (global.gamepad_connected[0])
    {
        var leftstick_x, leftstick_y, moving, deadzone, angle;
        leftstick_x = gamepad_axis_value(0, gp_axislh);
        leftstick_y = gamepad_axis_value(0, gp_axislv);
        deadzone = 0.5;
        moving = (abs(leftstick_x) > deadzone || abs(leftstick_y) > deadzone);

        if (moving)
        {
            angle = angle_8dir(point_direction(0, 0, leftstick_x, leftstick_y));
            if (menu_type == 0)
            {
                if (angle == 0)
                {
                    mainmenu_sel_next();
                }
                if (angle == 180)
                {
                    mainmenu_sel_previous();
                }
            }
            if (menu_type == 1)
            {
                if (angle == 270)
                {
                    mainmenu_sel_next();
                }
                if (angle == 90)
                {
                    mainmenu_sel_previous();
                }
                if (angle == 0)
                {
                    mainmenu_data_next(ds_list_find_value(list, cur_select + cur_line));
                }
                if (angle == 180)
                {
                    mainmenu_data_previous(ds_list_find_value(list, cur_select + cur_line));
                }
            }
        }
        if (gamepad_button_check_pressed(0, gp_face1))
        {
            mainmenu_action(ds_list_find_value(list, cur_select + cur_line));
        }
    }
}

