function adfile_write_file(argument0, argument1) {
  /* Advanced File System
	By Joshua Brookover, josh@ja-lb.com

	adfile_write_file

	Attach a file to the file, for later export.

	Arguments:
	1 - Handle
	2 - Filename (ex. "image.png")
	*/

  var wf, len;
  wf = file_bin_open(argument1, 0);
  file_bin_write_byte(argument0, 2);
  len = file_bin_size(wf);
  while (len > 255) {
    file_bin_write_byte(argument0, 255);
    len -= 255;
  }
  file_bin_write_byte(argument0, len);
  while (file_bin_position(wf) < file_bin_size(wf)) {
    file_bin_write_byte(argument0, 255 - file_bin_read_byte(wf));
  }
  file_bin_close(wf);
}
