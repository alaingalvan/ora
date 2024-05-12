/**
 * Advanced File System
 * By Joshua Brookover, josh@ja-lb.com
 *
 * adfile_read_file
 *
 * Export the next file to a location.
 *
 * Arguments:
 * 1 - Handle
 * 2 - Filename (ex. "image.png")
 *
 * Returns:
 * String value.
 */
function adfile_read_file(_handle, _filename) {
  var _type, _len, _by, _rf;
  _type = file_bin_read_byte(_handle);
  if (_type == 2) {
    _len = 0;
    _by = file_bin_read_byte(_handle);
    while (_by == 255) {
      _len += 255;
      _by = file_bin_read_byte(_handle);
    }
    _len += _by;
    _rf = file_bin_open(_filename, 1);
    for (var __i = 0; __i < _len; __i++) {
      file_bin_write_byte(_rf, 255 - file_bin_read_byte(_handle));
    }
    file_bin_close(_rf);
    return 1;
  } else {
    //show_error("The next saved data in this file is not a FILE value.",false);
    return 0;
  }
}
