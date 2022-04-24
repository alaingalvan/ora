function hierarchyselect() {
	var returnvar, originy;
	returnvar = -1;
	originy = 64;
	originx = 64;
	row = 3;
	col = 3;
	scroll = list_scroll;
	if (mouse_y > originy+16+scroll and mouse_y < originy+16+128+scroll)
	{
	    if (mouse_x > 16 and mouse_x < 16+128)
	    {
	        returnvar = 0;
	    }
	    if (mouse_x > (16*2)+128 and mouse_x < (16*2)+(128*2))
	    {
	        returnvar = 1;
	    }
	    if (mouse_x > (16*3)+(128*2) and mouse_x < (16*3)+(128*3))
	    {
	        returnvar = 2;
	    }
	}
	if mouse_y > originy+(16*2)+(128)+scroll and mouse_y < originy+(16*2)+(128*2)+scroll
	{
	    if (mouse_x > 16 and mouse_x < 16+128)
	    {
	        returnvar = 3;
	    }
	    if (mouse_x > (16*2)+128 and mouse_x < (16*2)+(128*2))
	    {
	        returnvar = 4;
	    }
	    if (mouse_x > (16*3)+(128*2) and mouse_x < (16*3)+(128*3))
	    {
	        returnvar = 5;
	    }
	}
	if mouse_y > originy+(16*3)+(128*2)+scroll and mouse_y < originy+(16*3)+(128*3)+scroll
	{
	    if (mouse_x > 16 and mouse_x < 16+128)
	    {
	        returnvar = 6;
	    }
	    if (mouse_x > (16*2)+128 and mouse_x < (16*2)+(128*2))
	    {
	        returnvar = 7;
	    }
	    if (mouse_x > (16*3)+(128*2) and mouse_x < (16*3)+(128*3))
	    {
	        returnvar = 8;
	    }
	}
	return returnvar;
}
