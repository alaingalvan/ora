b1 = make_color_rgb(83, 83, 83);
b2 = make_color_rgb(72, 72, 72);
s1 = make_color_rgb(91, 119, 163);
s2 = make_color_rgb(76, 88, 112);
draw_rectangle_color(x, y, x + width, y + height, b1, b1, b2, b2, false);
for (i = 0; i < ds_list_size(list); i += 1) {
  if (cur_select == i) {
    draw_rectangle_color(
      x,
      y + 4 + 24 * i,
      x + width,
      y + 4 + 24 * (i + 1),
      s1,
      s1,
      s2,
      s2,
      false
    );
  }
  draw_text(
    x + 4,
    y + 4 + 24 * i,
    string_hash_to_newline(ds_list_find_value(list, i))
  );
}
