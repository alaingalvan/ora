if (al > 0.0) {
  //d3d_set_projection_ortho(0,0,window_get_width(),window_get_height(),0);
  //d3d_set_hidden(false);
  d3d_set_lighting(false);
  draw_set_alpha(al);
  draw_set_color(c_black);
  draw_rectangle(0, 0, window_get_width(), window_get_height(), 0);
  //d3d_set_lighting(true)
  draw_set_alpha(1);
  //d3d_set_hidden(true);
  draw_set_color(c_white);
}
