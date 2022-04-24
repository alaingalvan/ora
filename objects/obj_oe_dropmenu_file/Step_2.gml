cur_menu = determine_dropdown()
dropdown_ini(cur_menu)
for (i = 0; i < ds_list_size(list); i += 1)
{
    if mouse_x > x and mouse_y >= y + 4 + (24 * i) and mouse_x < x + width and mouse_y < y + 4 + (24 * (i + 1))
    {
        cur_select = i
    }
}
    if (!(mouse_x > x and mouse_y > y and mouse_x < x + width and mouse_y < y + height))
    {
        cur_select = -1
    }

