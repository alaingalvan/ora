function adfile_write_string(argument0, argument1) {
  /* Advanced File System
	By Joshua Brookover, josh@ja-lb.com

	adfile_write_string

	Write a string to the file.

	Arguments:
	1 - Handle
	2 - String value (ex. "Hello world!")
	*/

  var len, l;
  file_bin_write_byte(argument0, 1);
  len = string_length(string(argument1));
  while (len > 255) {
    file_bin_write_byte(argument0, 255);
    len -= 255;
  }
  file_bin_write_byte(argument0, len);
  for (l = 1; l <= string_length(string(argument1)); l += 1) {
    file_bin_write_byte(argument0, 255 - ord(string_char_at(argument1, l)));
  }
}
