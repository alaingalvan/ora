function adfile_read_file(argument0, argument1) {
	/* Advanced File System
	By Joshua Brookover, josh@ja-lb.com

	adfile_read_file

	Export the next file to a location.

	Arguments:
	1 - Handle
	2 - Filename (ex. "image.png")

	Returns:
	String value.
	*/

	var type,len,by,rf;
	type = file_bin_read_byte(argument0);
	if (type == 2)
	{
	  len = 0;
	  by = file_bin_read_byte(argument0);
	  while (by == 255)
	  {
	    len += 255;
	    by = file_bin_read_byte(argument0);
	  }
	  len += by;
	  rf = file_bin_open(argument1,1);
	  repeat (len)
	  {
	    file_bin_write_byte(rf,255-file_bin_read_byte(argument0));
	  }
	  file_bin_close(rf);
	  return 1;
	}
	else
	{
	  //show_error("The next saved data in this file is not a FILE value.",false);
	  return 0;
	}



}
