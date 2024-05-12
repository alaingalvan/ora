var _t0, _view;

_t0 = make_color_rgb(37, 154, 199);
_view = __view_get(e__VW.HView, 0);

draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, 640, _view, false);
draw_set_font(fon_main12);
draw_set_alpha(1);
draw_set_valign(fa_bottom);

draw_text_ext_color(
  8,
  800 - 32,
  string_history + ">" + cur_string,
  16,
  600,
  _t0,
  _t0,
  _t0,
  _t0,
  1
);
draw_set_valign(fa_top);
draw_set_color(c_white);
