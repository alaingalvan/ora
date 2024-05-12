d3d_set_lighting(false);
draw_set_alpha(0.25);
draw_set_color(c_black);

draw_rectangle(0, 0, window_get_width(), window_get_height(), 0);

draw_set_alpha(0.25);

draw_rectangle(
  0,
  window_get_height() / 2 - 64,
  window_get_width(),
  window_get_height() / 2 + 64,
  0
);

draw_set_alpha(1);
draw_set_color(c_white);

draw_set_halign(fa_center);
draw_set_halign(fa_middle);
draw_text(
  window_get_width() / 2,
  window_get_height() / 2 - 20,
  string_hash_to_newline("Thanks for playing! Be sure to rate/fav/subscribe!")
);
draw_set_halign(fa_left);
draw_set_halign(fa_top);
