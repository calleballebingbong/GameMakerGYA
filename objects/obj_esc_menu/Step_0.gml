if !instance_exists(obj_text_box) {
	esc_key = keyboard_check_pressed(vk_escape)
	if esc_key {
		global.paused = !global.paused;
		visible = global.paused;
		depth = -999
	}
		// input
		up_key = keyboard_check_pressed(vk_up);
		down_key = keyboard_check_pressed(vk_down);
		accept_key = keyboard_check_pressed(vk_enter);

		//move through menu
		pos += down_key - up_key;
		if pos >= op_lenght {pos = 0};
		if pos < 0 {pos = op_lenght-1};

		//store num of options in current menu
		op_lenght = array_length(option[menu_level]);


		//using options
		if accept_key {
	
			var _sml = menu_level;


			switch(menu_level) {
	
				//pause menu
				case 0:
					switch(pos) {
						//start game
						case 0:
						visible = false
						break;
				
						//settings
						case 1: menu_level = 1
						break;
						//quit game
						case 2:
						room_goto(rm_title_screen)
						break;
						}
					break;
		
					//settings
					case 1:
					switch(pos) {
						//window size
						case 0:
			
						break;
			
						//Brightness
						case 1:
			
						break;
			
						//Controls
						case 2:
			
						break;
			
						//Back
						case 3:
							menu_level = 0;
							break;
				}	
	
			}
	
			//set position level
				if _sml != menu_level {pos = 0};
	
				//Correct option lenght
			op_lenght = array_length(option[menu_level]);
	
		}
}