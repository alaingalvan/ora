/* Advanced File System
By Joshua Brookover, josh@ja-lb.com

adfile_read_string

Read the next value from the file.

Arguments:
1 - Handle

Returns:
String value.
*/

var type,len,by,ret;
type = file_bin_read_byte(argument0);
if (type == 1)
{
  len = 0;
  by = file_bin_read_byte(argument0);
  while (by == 255)
  {
    len += 255;
    by = file_bin_read_byte(argument0);
  }
  len += by;
  ret = "";
  repeat (len)
  {
    ret += chr(255-file_bin_read_byte(argument0));
  }
  return ret;
}
else
{
  //show_error("The next saved data in this file is not a STRING value.",false);
  return "";
}
