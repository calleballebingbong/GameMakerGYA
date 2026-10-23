if global.man_visible == true
	{
	depth = -9999
	x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
	y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;
	visible = true
	}
	else {
	visible = false;
	}
	
if keyboard_check_pressed(vk_enter)
	{
	global.man_visible = false;
	}