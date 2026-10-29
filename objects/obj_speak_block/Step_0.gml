if keyboard_check_pressed(ord("E")) && distance_to_object(obj_player) < 10 && !instance_exists(obj_text_box) && !(text_id == "Enemy1" && global.enemy1Defeated)
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