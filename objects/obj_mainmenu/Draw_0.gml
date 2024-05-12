/// @description Backgrounds
//draw_background_

///Button based Menu
//Logo
draw_sprite_ext(
  spr_ui_logo,
  0,
  (1280 / 2 - 256) * scale,
  (720 / 2) * scale,
  0.5 * scale,
  0.5 * scale,
  0,
  c_white,
  0.8
);

draw_set_font(fon_main);

if (menu_type == 0) {
  //Variable Ini
  var xx, xmin, xmax, xminf, xmaxf, ww, aa;
  xmin = 1280 / 2 - 192 + button_w * 0 + button_spacing * 0;
  xmax = 1280 / 2 - 192 + button_w * 2 + button_spacing * 2;
  xminf = 1280 / 2 - 192 + button_w * -1 + button_spacing * -1;
  xmaxf = 1280 / 2 - 192 + button_w * 3 + button_spacing * 3;
  ww = button_w + button_spacing;
  aa = 1.0;

  draw_set_halign(fa_right);
  //Draw Menu Buttons
  for (var a = 0; a < ds_list_size(list); a++) {
    xx = 1280 / 2 - 192 + button_w * a + button_spacing * a + list_scroll;

    if (xx < xmin) {
      aa = (xx - xminf) / ww;
    } else if (xx > xmax) {
      aa = (xmaxf - xx) / ww;
    } else {
      aa = 1.0;
    }

    aa *= trans_alpha;
    aa = clamp(aa, 0.0, 1.0);
    if (aa > 0.0) {
      draw_set_alpha(0.2 * aa);
      draw_rectangle_color(
        xx * scale,
        (button_y - button_y_add[a] * button_y_max) * scale,
        (xx + button_w) * scale,
        (button_y + button_h) * scale,
        button_c[1],
        button_c[1],
        button_c[0],
        button_c[0],
        false
      );
      draw_set_alpha(aa);
      draw_text_color(
        (xx + button_w - 4) * scale,
        (button_y + button_h - 48) * scale,
        string_hash_to_newline(ds_list_find_value(list, a)),
        c_white,
        c_white,
        c_white,
        c_white,
        0.75 * aa
      );
      draw_set_alpha(1);
    }
  }

  //Arrows
  draw_set_alpha(0.15);
  xx = 1280 / 2 - 192 + button_w * 3 + button_spacing * 3.5;
  draw_sprite_ext(
    spr_mainmenu_arrow,
    0,
    xx * scale,
    (button_y + button_h / 2) * scale,
    (3 / 4) * scale,
    (3 / 4) * scale,
    0,
    c_white,
    0.15 * trans_alpha
  );
  xx = 1280 / 2 - 192 + button_spacing * -1.5;
  draw_sprite_ext(
    spr_mainmenu_arrow,
    0,
    xx * scale,
    (button_y + button_h / 2) * scale,
    (-3 / 4) * scale,
    (3 / 4) * scale,
    0,
    c_white,
    0.15 * trans_alpha
  );
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);

///List based Menu
if (menu_type == 1) {
  //Ini
  var aa, x1, x2, y1, y2, txt, data;
  aa = 0.12;
  aa *= trans_alpha;
  aa = clamp(aa, 0.0, 1.0);

  x1 = 1280 / 2 + 256;
  y1 = 0;

  x2 = 1280;
  y2 = 720;

  //Draw Back
  draw_set_alpha(aa);
  draw_rectangle_color(
    x1 * scale,
    y1 * scale,
    x2 * scale,
    y2 * scale,
    button_c[1],
    button_c[1],
    button_c[1],
    button_c[1],
    0
  );

  //Draw Title
  draw_set_halign(fa_left);
  draw_set_valign(fa_middle);
  x1 = 1280 / 2 + 256 + 32;
  y1 = 128 - 12;
  draw_set_font(fon_main36);
  draw_text_color(
    x1 * scale,
    y1 * scale,
    string_hash_to_newline(cur_menu),
    c_white,
    c_white,
    c_white,
    c_white,
    trans_alpha
  );
  draw_set_font(fon_main);

  y1 = 128 + 64;
  var size;
  size = ds_list_size(list);
  if (size > 7) {
    size = 7;
  }
  //Draw Each instance of the list.
  for (var i = 0; i < size; i += 1) {
    txt = ds_list_find_value(list, i + max(cur_line, 0));
    data = mainmenu_data(txt);
    if (data != "") {
      draw_set_halign(fa_center);
      draw_text_color(
        (1200 - 8) * scale,
        (y1 + i * 64) * scale,
        string_hash_to_newline(data),
        c_white,
        c_white,
        c_white,
        c_white,
        trans_alpha
      );
      draw_text_color(
        (1152 - 32) * scale,
        (y1 + i * 64) * scale,
        string_hash_to_newline("<"),
        c_white,
        c_white,
        c_white,
        c_white,
        trans_alpha
      );
      draw_text_color(
        (1280 - 16) * scale,
        (y1 + i * 64) * scale,
        string_hash_to_newline(">"),
        c_white,
        c_white,
        c_white,
        c_white,
        trans_alpha
      );
      draw_set_halign(fa_left);
    }
    if (i == cur_select) {
      draw_set_alpha(0.1 * trans_alpha);
      draw_rectangle_color(
        (896 + (384 - 384 * button_y_add[i])) * scale,
        (y1 + (i - 0.5) * 64) * scale,
        1280 * scale,
        (y1 + (i + 0.5) * 64) * scale,
        button_c[1],
        button_c[1],
        button_c[1],
        button_c[1],
        0
      );
      draw_set_font(fon_main20);
      draw_set_alpha(trans_alpha);
      draw_text_ext_color(
        (x1 - 4) * scale,
        (720 - 64) * scale,
        string_hash_to_newline(mainmenu_description(txt)),
        32 * scale,
        342 * scale,
        c_white,
        c_white,
        c_white,
        c_white,
        trans_alpha
      );
    }
    draw_set_font(fon_main);
    draw_text_color(
      x1 * scale,
      (y1 + i * 64) * scale,
      string_hash_to_newline(txt),
      c_white,
      c_white,
      c_white,
      c_white,
      trans_alpha
    );
  }
}

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fon_main);
