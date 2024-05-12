if ((mouse_x > x + width && mouse_y > y + height) || mouse_x < x) {
  instance_destroy();
}

for (i = 0; i < ds_list_size(list); i += 1) {
  if (
    mouse_x > x &&
    mouse_y > y + 4 + 24 * i &&
    mouse_x < x + width &&
    mouse_y < y + 4 + 24 * (i + 1)
  ) {
    dropmenu_perform(i);
  }
}
