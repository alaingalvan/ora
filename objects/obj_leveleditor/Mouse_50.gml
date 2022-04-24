var inviewport, inproperties;
inviewport = (mouse_x < 480 and mouse_y > 32 and!dropdown) or editorclosed
inhierarchy = mouse_y < 544
inproperties = mouse_y >= 544

if inviewport
{

    if inhierarchy
    {
    //Do something
    }
    if inproperties
    {
        //test
    }
}
if !inviewport and mouse_y > 32
{
    //Can't place inside viewport
    if !is_string(cur_object) and (place_empty(select_x, select_y) or placeover)
    {
        instance_create(select_x, select_y, cur_object)
    }
}

