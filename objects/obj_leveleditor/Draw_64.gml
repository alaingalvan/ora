b = make_color_rgb(72, 72, 72)
draw_rectangle_color(0, 0, 480, __view_get( e__VW.HView, 0 ), b, b, b, b, false)
draw_background_stretched(bac_oe_shadowr, 480, 0, 11, __view_get( e__VW.HView, 0 ))
draw_background_stretched(bac_oe_subbar, 0, 32, 480, 32)
draw_set_valign(fa_middle)
draw_set_font(fon_main12)
draw_background_stretched(bac_oe_subbar, 0, 32, 480, 32)
draw_background_stretched(bac_oe_subbar, 0, 544, 480, 32)
draw_text(16, 48, string_hash_to_newline("Hierarchy View"))
//draw_text(16, 544 + 16, "Properties")
/*
Hierarchy Window
A file browser that lets you select prefabs for placement in the engine.
*/
if cur_window = 0
{
    hierarchy_draw();
}
/*
Instance Window
A list of all the current instances in the room that you can imediately go to. 
*/
if cur_window = 1
{
    filemanager_draw();
}

/*
Instance Window
A list of all the current instances in the room that you can imediately go to. 
*/
if cur_window = 2
{
    instancelist_draw();
}
draw_background_stretched(bac_oe_scrollbar, 448, 64, 32, 480)
/*
Properties Window
A list of editable parameters that the currently selected could be assigned. 
*/
//----Test
/*
Top Menu
*/
draw_background_stretched(bac_oe_topbar, 0, 0, __view_get( e__VW.WView, 0 ), 43) draw_set_font(fon_main18)
draw_text(12, 16, string_hash_to_newline("ORA Editor"))
draw_set_halign(fa_right)
draw_set_font(fon_main12)
draw_text(__view_get( e__VW.WView, 0 ) - 16, 16, string_hash_to_newline(string(instance_count) + " obj | " + string(fps) + " fps | Version 0.5"))
draw_set_valign(fa_top)
draw_set_halign(fa_left)
//draw_text(640,48,string(sel_x))

/* */
/*  */
