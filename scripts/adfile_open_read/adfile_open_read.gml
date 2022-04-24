function adfile_open_read(argument0) {
	/* Advanced File System
	By Joshua Brookover, josh@ja-lb.com

	adfile_open_read

	Open a new file for reading.

	Arguments:
	1 - Filename (ex. "myfile.txt")

	Returns:
	Handle for the file.
	*/

	return file_bin_open(argument0,0);



}
