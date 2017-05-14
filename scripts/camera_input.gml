//camera_input
if (os_type == os_android || os_type == os_ios)
{
    if (mouse_check_button_pressed(mb_left))
    {
        //Camera control
        global.mb_middle_event_x = mouse_x;
        global.mb_middle_event_y = mouse_y;

        rotating = true;
        prev_angle_x = angle_x;
        prev_angle_y = angle_y;

    }
    if (mouse_check_button_released(mb_left))
    {
        rotating = false;
    }
}

if (mouse_check_button_pressed(mb_right))
{
    //Camera control
    global.mb_middle_event_x = mouse_x;
    global.mb_middle_event_y = mouse_y;

    rotating = true;
    prev_angle_x = angle_x;
    prev_angle_y = angle_y;

}
if (mouse_check_button_released(mb_right))
{
    rotating = false;
   
}
