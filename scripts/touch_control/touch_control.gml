function touch_control() {
	if (os_type == os_android)
	{
	    virtual_key_add(0, window_get_height() - 128 * (window_get_height() / 320), 128 * (window_get_width() / 480), window_get_height(), global.left);
	    virtual_key_add(128 * (window_get_width() / 480), window_get_height() - 128 * (window_get_height() / 320), 256 * (window_get_width() / 480), window_get_height(), global.right);
	    virtual_key_add(window_get_width() - 128 * (window_get_width() / 480), window_get_height() - 128 * (window_get_height() / 320), 128 * (window_get_width() / 480), window_get_height(), global.up);
	}



}
