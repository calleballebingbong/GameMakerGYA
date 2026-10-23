if keyboard_check_pressed(ord("E")) && distance_to_object(obj_player) < 10 && !instance_exists(obj_text_box)
	{
	create_textbox(text_id)
	}
	
	if global.VidarShow == true
	{
		visible = false
	}
	else
	{
		visible = true
	}