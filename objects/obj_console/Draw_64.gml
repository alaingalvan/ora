var t0;

t0 = make_color_rgb(37, 154, 199);
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, 640, __view_get(e__VW.HView, 0), false);
draw_set_font(fon_main12);
draw_set_alpha(1);
draw_set_valign(fa_bottom);
draw_text_ext_color(
  x + 8,
  y - 8,
  string_hash_to_newline(string_history + ">" + cur_string),
  16,
  600,
  t0,
  t0,
  t0,
  t0,
  1
);
draw_set_valign(fa_top);
draw_set_color(c_white);
