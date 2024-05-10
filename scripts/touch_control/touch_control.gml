function touch_control() {
  if (os_type == os_android || os_type == os_ios) {
    var _window_w = window_get_width();
    var _window_h = window_get_height();
    var _dpi_x = display_get_dpi_x();
    var _dpi_y = display_get_dpi_y();
    var _button_size = 128;
    virtual_key_add(
      0,
      _window_h - _button_size * _dpi_y,
      _button_size * _dpi_x,
      _window_h,
      global.left
    );
    virtual_key_add(
      _button_size * _dpi_x,
      _window_h - _button_size * _dpi_y,
      256 * _dpi_x,
      _window_h,
      global.right
    );
    virtual_key_add(
      _window_w - _button_size * _dpi_x,
      _window_h - _button_size * _dpi_y,
      _button_size * _dpi_x,
      _window_h,
      global.up
    );
  }
}
