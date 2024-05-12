draw_sprite_ext(
  spr_ui_logo,
  0,
  window_get_width() / 2 - 256,
  window_get_height() / 2,
  0.5,
  0.5,
  0,
  c_white,
  0.8
);

var c, w, h, my, m1x, m2x, m3x;
c = make_color_rgb(191, 191, 191);
w = 224;
h = 96;
my = window_get_height() / 2 + 272;

m1x = window_get_width() / 2 - 128;
m2x = window_get_width() / 2 + 128;
m3x = window_get_width() / 2 + 384;

draw_set_alpha(0.4);
/*
draw_rectangle_color(m1x,my,m1x+w,my+h,c,c,c,c,0)

draw_rectangle_color(m2x,my,m2x+w,my+h,c,c,c,c,0)

draw_rectangle_color(m3x,my,m3x+w,my+h,c,c,c,c,0)
*/
draw_set_alpha(1);

/* */
/*  */
