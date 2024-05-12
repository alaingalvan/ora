function touch_control() {
  if (os_type == os_android || os_type == os_ios) {
    // It seems as though the virtual keys are based on the room viewport.
    var _window_w = 1280;
    var _window_h = 800;
    var _padding = 32;
    var _button_size_x = 128;
    var _button_size_y = _button_size_x * 2.5;
    var _button_y = _window_h * 0.5 - _button_size_y * 0.5;
    var _left_btn = virtual_key_add(
      _padding,
      _button_y,
      _button_size_x,
      _button_size_y,
      global.left
    );
    var _right_btn = virtual_key_add(
      _padding + _button_size_x,
      _button_y,
      _button_size_x * 2,
      _button_size_y,
      global.right
    );
    var _up_x = _window_w - _button_size_x * 2 - _padding;
    var _up_btn = virtual_key_add(
      _up_x,
      _button_y,
      _button_size_x,
      _button_size_y,
      global.up
    );
  }
}
