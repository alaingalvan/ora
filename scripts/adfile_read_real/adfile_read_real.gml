function adfile_read_real(argument0) {
	/* Advanced File System
	By Joshua Brookover, josh@ja-lb.com

	adfile_read_real

	Read the next value from the file.

	Arguments:
	1 - Handle

	Returns:
	Real value.
	*/

	var type,len,ret;
	type = file_bin_read_byte(argument0);
	if (type == 0)
	{
	  len = file_bin_read_byte(argument0);
	  ret = "";
	  repeat (len)
	  {
	    ret += chr(255-file_bin_read_byte(argument0));
	  }
	  return real(ret);
	}
	else
	{
	  //show_error("The next saved data in this file is not a REAL value.",false);
	  return 0;
	}



}
