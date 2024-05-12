function adfile_read_string(argument0) {
  /* Advanced File System
	By Joshua Brookover, josh@ja-lb.com

	adfile_read_string

	Read the next value from the file.

	Arguments:
	1 - Handle

	Returns:
	String value.
	*/

  var _type, _len, _by, _ret;
  _type = file_bin_read_byte(argument0);
  if (_type == 1) {
    _len = 0;
    _by = file_bin_read_byte(argument0);
    while (_by == 255) {
      _len += 255;
      _by = file_bin_read_byte(argument0);
    }
    _len += _by;
    _ret = "";
    for (var __i = 0; __i < _len; __i++) {
      {
        _ret += chr(255 - file_bin_read_byte(argument0));
      }
    }
    return _ret;
  } else {
    //show_error("The next saved data in this file is not a STRING value.",false);
    return "";
  }
}
