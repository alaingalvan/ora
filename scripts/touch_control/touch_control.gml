function touch_control() {
  if (os_type == os_android || os_type == os_ios) {
    // It seems as though the virtual keys are based on the room viewport.
    var _window_w = display_get_width();
    var _window_h = display_get_height();
    var _button_size_x = 0.125 * _window_w;
    var _button_size_y = 1.0 * _window_h;
    var _button_y = 0;
    var _left_btn = virtual_key_add(
      0,
      _button_y,
      _button_size_x,
      _button_size_y,
      global.left
    );
    var _right_btn = virtual_key_add(
      _button_size_x,
      _button_y,
      _button_size_x,
      _button_size_y,
      global.right
    );
    var _up_x = _window_w - _button_size_x * 2;
    var _up_btn = virtual_key_add(
      _up_x,
      _button_y,
      _button_size_x * 2,
      _button_size_y,
      global.up
    );
  }
}
