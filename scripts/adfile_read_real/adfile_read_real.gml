/**
 Advanced File System
	By Joshua Brookover, josh@ja-lb.com

	adfile_read_real

	Read the next value from the file.

	Arguments:
	1 - Handle

	Returns:
	Real value.
	*/
function adfile_read_real(_handle) {
  var _type, _len, _ret;
  _type = file_bin_read_byte(_handle);
  if (_type == 0) {
    _len = file_bin_read_byte(_handle);
    _ret = "";
    for (var __i = 0; __i < _len; __i++) {
      _ret += chr(255 - file_bin_read_byte(_handle));
    }
    return real(_ret);
  } else {
    //show_error("The next saved data in this file is not a REAL value.",false);
    return 0;
  }
}
