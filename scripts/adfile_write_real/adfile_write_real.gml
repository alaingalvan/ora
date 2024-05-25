function adfile_write_real(_handle, _real) {
  /* Advanced File System
	By Joshua Brookover, josh@ja-lb.com

	adfile_write_real

	Write a string to the file.

	Arguments:
	1 - Handle
	2 - Real value (ex. 235893)
	pos - byte position. 
	*/


  file_bin_write_byte(_handle, 0);
  file_bin_write_byte(_handle, string_length(string(_real)));
  for (var _l = 1; _l <= string_length(string(_real)); _l += 1) {
    file_bin_write_byte(
      _handle,
      255 - ord(string_char_at(string(_real), _l))
    );
  }
}
