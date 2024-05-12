function adfile_write_real(argument0, argument1) {
  /* Advanced File System
	By Joshua Brookover, josh@ja-lb.com

	adfile_write_real

	Write a string to the file.

	Arguments:
	1 - Handle
	2 - Real value (ex. 235893)
	pos - byte position. 
	*/

  var l;
  file_bin_write_byte(argument0, 0);
  file_bin_write_byte(argument0, string_length(string(argument1)));
  for (l = 1; l <= string_length(string(argument1)); l += 1) {
    file_bin_write_byte(
      argument0,
      255 - ord(string_char_at(string(argument1), l))
    );
  }
}
