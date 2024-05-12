/**
 * Advanced File System
 * By Joshua Brookover, josh@ja-lb.com
 * Open a new file for reading.
 * Arguments:
 * 1 - Filename (ex. "myfile.txt")
 * Returns:
 * Handle for the file.
 */
function adfile_open_read(_filename) {
  return file_bin_open(_filename, 0);
}
