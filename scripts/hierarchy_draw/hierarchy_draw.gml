function hierarchy_draw() {
	//hierarchy_draw()
	//Selection
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fon_main10)
	if (cur_x >= 0 and cur_y - (cur_line * line_width) >= 0)
	{
	    s1 = make_color_rgb(91, 119, 163)
	    s2 = make_color_rgb(76, 88, 112)
	    draw_set_alpha(0.2)
	    draw_rectangle_color((16 * (cur_x + 1)) + (128 * (cur_x)), 64 + (16 * (cur_y + 1)) + (128 * cur_y) + list_scroll, (16 * (cur_x + 1)) + (128 * (cur_x)) + 127, 64 + (16 * (cur_y + 1)) + (128 * cur_y) + list_scroll + 127, s1, s1, s2, s2, false)
	    draw_set_alpha(1)
	}
	if (sel_x >= 0 and sel_y - (cur_line * line_width) >= 0)
	{
	    s1 = make_color_rgb(91, 119, 163)
	    s2 = make_color_rgb(76, 88, 112)
	    draw_set_alpha(0.75)
	    draw_rectangle_color((16 * (sel_x + 1)) + (128 * (sel_x)), 64 + (16 * (sel_y + 1)) + (128 * sel_y) + list_scroll, (16 * (sel_x + 1)) + (128 * (sel_x)) + 127, 64 + (16 * (sel_y + 1)) + (128 * sel_y) + list_scroll + 127, s1, s1, s2, s2, false)
	    draw_set_alpha(1)
	}

	if ds_grid_width(cur_list) > 0 + (cur_line * line_width)
	{
	    if is_string(ds_grid_get(cur_list, 0 + (cur_line * line_width), 0)) //Determines root folder
	    {
	        draw_sprite(spr_oe_folder, 0, 32, 64 + 32)
	    }
	    else
	    {
	        draw_sprite_stretched(ds_grid_get(cur_list, 0 + (cur_line * line_width), 1), 0, 32, 64 + 32, 96, 96)
	    }
	    draw_text(32 + (96 / 2), 64 + 32 + 96 + 24, string_hash_to_newline(ds_grid_get(cur_list, 0 + (cur_line * line_width), 2)))
	}
	if ds_grid_width(cur_list) > 1 + (cur_line * line_width)
	{
	    if is_string(ds_grid_get(cur_list, 1 + (cur_line * line_width), 0))
	    {
	        draw_sprite(spr_oe_folder, 0, 32 + 48 + 96, 64 + 32)
	    }
	    else
	    {
	        draw_sprite_stretched(ds_grid_get(cur_list, 1 + (cur_line * line_width), 1), 0, 32 + 48 + 96, 64 + 32, 96, 96)
	    }
	    draw_text(32 + 48 + 96 + (96 / 2), 64 + 32 + 96 + 24, string_hash_to_newline(ds_grid_get(cur_list, 1 + (cur_line * line_width), 2)))
	}
	if ds_grid_width(cur_list) > 2 + (cur_line * line_width)
	{
	    if is_string(ds_grid_get(cur_list, 2 + (cur_line * line_width), 0))
	    {
	        draw_sprite(spr_oe_folder, 0, 32 + (48 * 2) + (96 * 2), 64 + 32)
	    }
	    else
	    {
	        draw_sprite_stretched(ds_grid_get(cur_list, 2 + (cur_line * line_width), 1), 0, 32 + (48 * 2) + (96 * 2), 64 + 32, 96, 96)
	    }
	    draw_text(32 + (48 * 2) + (96 * 2) + (96 / 2), 64 + 32 + 96 + 24, string_hash_to_newline(ds_grid_get(cur_list, 2 + (cur_line * line_width), 2)))
	}

	if ds_grid_width(cur_list) > 3 + (cur_line * line_width)
	{
	    if is_string(ds_grid_get(cur_list, 3 + (cur_line * line_width), 0))
	    {
	        draw_sprite(spr_oe_folder, 0, 32, 64 + 32 + 96 + 48)
	    }
	    else
	    {
	        draw_sprite_stretched(ds_grid_get(cur_list, 3 + (cur_line * line_width), 1), 0, 32, 64 + 32 + 96 + 48, 96, 96)
	    }
	    draw_text(32 + (96 / 2), 64 + 32 + (96 * 2) + 48 + 24, string_hash_to_newline(ds_grid_get(cur_list, 3 + (cur_line * line_width), 2)))
	}
	if ds_grid_width(cur_list) > 4 + (cur_line * line_width)
	{
	    if is_string(ds_grid_get(cur_list, 4 + (cur_line * line_width), 0))
	    {
	        draw_sprite(spr_oe_folder, 0, 32 + 48 + 96, 64 + 32 + 96 + 48)
	    }
	    else
	    {
	        draw_sprite_stretched(ds_grid_get(cur_list, 4 + (cur_line * line_width), 1), 0, 32 + 48 + 96, 64 + 32 + 96 + 48, 96, 96)
	    }
	    draw_text(32 + 48 + 96 + (96 / 2), 64 + 32 + (96 * 2) + 48 + 24, string_hash_to_newline(ds_grid_get(cur_list, 4 + (cur_line * line_width), 2)))
	}
	if ds_grid_width(cur_list) > 5 + (cur_line * line_width)
	{
	    if is_string(ds_grid_get(cur_list, 5 + (cur_line * line_width), 0))
	    {
	        draw_sprite(spr_oe_folder, 0, 32 + (48 * 2) + (96 * 2), 64 + 32 + 96 + 48)
	    }
	    else
	    {
	        draw_sprite_stretched(ds_grid_get(cur_list, 5 + (cur_line * line_width), 1), 0, 32 + (48 * 2) + (96 * 2), 64 + 32 + 96 + 48, 96, 96)
	    }
	    draw_text(32 + (48 * 2) + (96 * 2) + (96 / 2), 64 + 32 + (96 * 2) + 48 + 24, string_hash_to_newline(ds_grid_get(cur_list, 5 + (cur_line * line_width), 2)))
	}

	if ds_grid_width(cur_list) > 6 + (cur_line * line_width)
	{
	    if is_string(ds_grid_get(cur_list, 6 + (cur_line * line_width), 0))
	    {
	        draw_sprite(spr_oe_folder, 0, 32, 64 + 32 + (96 * 2) + (48 * 2))
	    }
	    else
	    {
	        draw_sprite_stretched(ds_grid_get(cur_list, 6 + (cur_line * line_width), 1), 0, 32, 64 + 32 + (96 * 2) + (48 * 2), 96, 96)
	    }
	    draw_text(32 + (96 / 2), 64 + 32 + (96 * 3) + (48 * 2) + 24, string_hash_to_newline(ds_grid_get(cur_list, 6 + (cur_line * line_width), 2)))
	}
	if ds_grid_width(cur_list) > 7 + (cur_line * line_width)
	{
	    if is_string(ds_grid_get(cur_list, 7 + (cur_line * line_width), 0))
	    {
	        draw_sprite(spr_oe_folder, 0, 32 + 48 + 96, 64 + 32 + (96 * 2) + (48 * 2))
	    }
	    else
	    {
	        draw_sprite_stretched(ds_grid_get(cur_list, 7 + (cur_line * line_width), 1), 0, 32 + 48 + 96, 64 + 32 + (96 * 2) + (48 * 2), 96, 96)
	    }
	    draw_text(32 + 48 + 96 + (96 / 2), 64 + 32 + (96 * 3) + (48 * 2) + 24, string_hash_to_newline(ds_grid_get(cur_list, 7 + (cur_line * line_width), 2)))

	}
	if ds_grid_width(cur_list) > 8 + (cur_line * line_width)
	{
	    if is_string(ds_grid_get(cur_list, 8 + (cur_line * line_width), 0))
	    {
	        draw_sprite(spr_oe_folder, 0, 32 + (48 * 2) + (96 * 2), 64 + 32 + (96 * 2) + (48 * 2))
	    }
	    else
	    {
	        draw_sprite_stretched(ds_grid_get(cur_list, 8 + (cur_line * line_width), 1), 0, 32 + (48 * 2) + (96 * 2), 64 + 32 + (96 * 2) + (48 * 2), 96, 96)
	    }
	    draw_text(32 + (48 * 2) + (96 * 2) + (96 / 2), 64 + 32 + (96 * 3) + (48 * 2) + 24, string_hash_to_newline(ds_grid_get(cur_list, 8 + (cur_line * line_width), 2)))
	}
	draw_set_halign(fa_left) draw_set_valign(fa_middle)
	draw_set_font(fon_main12)



}
