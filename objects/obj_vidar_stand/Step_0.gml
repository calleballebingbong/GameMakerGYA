if global.VidarShow == true
	{
	depth = -9999
	visible = true
	}
	else {
	visible = false;
	}
	
if keyboard_check_pressed(vk_enter)
	{
	global.VidarShow = false;
	}