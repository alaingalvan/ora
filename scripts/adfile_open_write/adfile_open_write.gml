function adfile_open_write(argument0) {
  /* Advanced File System
	By Joshua Brookover, josh@ja-lb.com

	adfile_open_write(filename)

	Open a new file for writing.

	Arguments:
	1 - Filename (ex. "myfile.txt")

	Returns:
	Handle for the file.
	*/

  return file_bin_open(argument0, 1);
}
