if !instance_exists(obj_text_box) {
	var _cKey = keyboard_check_pressed(ord("C"));
	var _escKey = keyboard_check_pressed(vk_escape);

	if (inventoryOpen)
	{
		if (_cKey || _escKey)
		{
			inventoryOpen = false;
			global.paused = false;
			visible = false;
			exit;
		}

		if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right))
		{
			inventoryCategory = 1 - inventoryCategory;
			inventorySelection = 0;
		}

		var _entryCount = 0;
		if (inventoryCategory == 0)
		{
			var _itemIds = variable_struct_get_names(global.itemCatalog);
			for (var i = 0; i < array_length(_itemIds); i++)
			{
				if (global.itemManager.Count(_itemIds[i]) > 0) _entryCount++;
			}
		}
		else
		{
			var _actions = global.party[0].actions;
			for (var i = 0; i < array_length(_actions); i++)
			{
				if (!variable_struct_exists(_actions[i], "inventoryAction")) _entryCount++;
			}
		}

		if (_entryCount > 0)
		{
			inventorySelection += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
			if (inventorySelection < 0) inventorySelection = _entryCount - 1;
			if (inventorySelection >= _entryCount) inventorySelection = 0;
		}
		else
		{
			inventorySelection = 0;
		}
		exit;
	}

	if (_cKey && !global.paused)
	{
		inventoryOpen = true;
		inventoryCategory = 0;
		inventorySelection = 0;
		global.paused = true;
		visible = true;
		depth = -999;
		exit;
	}

	if _escKey
	{
		global.paused = !global.paused;
		visible = global.paused;
		depth = -999;
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
						global.paused = !global.paused;
						visible = global.paused;
						depth = -999
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