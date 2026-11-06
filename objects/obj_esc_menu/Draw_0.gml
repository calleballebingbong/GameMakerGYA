draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

if (inventoryOpen)
{
	var _itemIds = [];
	var _actionList = [];
	if (inventoryCategory == 0)
	{
		var _allItemIds = variable_struct_get_names(global.itemCatalog);
		for (var i = 0; i < array_length(_allItemIds); i++)
		{
			if (global.itemManager.Count(_allItemIds[i]) > 0) array_push(_itemIds, _allItemIds[i]);
		}
	}
	else
	{
		var _allActions = global.party[0].actions;
		for (var i = 0; i < array_length(_allActions); i++)
		{
			if (!variable_struct_exists(_allActions[i], "inventoryAction")) array_push(_actionList, _allActions[i]);
		}
	}

	var _entryCount = array_length(_itemIds);
	if (inventoryCategory == 1) _entryCount = array_length(_actionList);
	var _panelWidth = 256;
	var _panelHeight = 168;
	var _panelX = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - _panelWidth) / 2;
	var _panelY = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) - _panelHeight) / 2;
	var _listX = _panelX + op_border;
	var _listY = _panelY + 38;
	var _listWidth = 104;
	var _descriptionX = _listX + _listWidth + 12;
	var _descriptionWidth = _panelWidth - _listWidth - op_border * 2 - 12;
	var _visibleRows = 6;
	var _firstRow = max(0, inventorySelection - _visibleRows + 1);
	var _description = "No items available.";

	draw_sprite_stretched(spr_menu_background_black,0, _panelX, _panelY, _panelWidth, _panelHeight);
	draw_set_color(inventoryCategory == 0 ? c_yellow : c_white);
	draw_text(_listX, _panelY + op_border, "Items");
	draw_set_color(inventoryCategory == 1 ? c_yellow : c_white);
	draw_text(_listX + 52, _panelY + op_border, "Attacks");
	draw_set_color(c_white);

	if (inventoryCategory == 0)
	{
		if (_entryCount > 0)
		{
			var _selectedItem = global.itemCatalog[$ _itemIds[inventorySelection]];
			_description = _selectedItem.description;
		}
		for (var i = _firstRow; i < min(_firstRow + _visibleRows, _entryCount); i++)
		{
			var _itemId = _itemIds[i];
			var _item = global.itemCatalog[$ _itemId];
			var _itemColor = (i == inventorySelection) ? c_yellow : c_white;
			draw_set_color(_itemColor);
			draw_text(_listX, _listY + (i - _firstRow) * op_space, _item.name + " x" + string(global.itemManager.Count(_itemId)));
		}
		if (_entryCount == 0) draw_text(_listX, _listY, "No items");
	}
	else
	{
		_description = "No attacks available.";
		if (_entryCount > 0)
		{
			var _selectedAction = _actionList[inventorySelection];
			_description = _selectedAction.menuDescription;
		}
		for (var i = _firstRow; i < min(_firstRow + _visibleRows, _entryCount); i++)
		{
			var _actionColor = (i == inventorySelection) ? c_yellow : c_white;
			draw_set_color(_actionColor);
			draw_text(_listX, _listY + (i - _firstRow) * op_space, _actionList[i].name);
		}
		if (_entryCount == 0) draw_text(_listX, _listY, "No attacks");
	}

	draw_set_color(c_white);
	draw_text_ext(_descriptionX, _listY, _description, 2, _descriptionWidth);
	draw_text(_listX, _panelY + _panelHeight - 22, "Up/Down: select   Left/Right: category");
	draw_text(_listX, _panelY + _panelHeight - 10, "C / Esc: close");
}
else
{
	//dynamically get width & height of menu
	var _new_w = 0;
	for(var i = 0; i < op_lenght; i++)
	{
		var _op_W = string_width(option[menu_level, i]);
		_new_w = max(_new_w, _op_W);
	}
	width = _new_w + op_border*2;
	height = op_border*2 + string_height(option[menu_level, 0]) + (op_lenght-1)*op_space;

	//center menu
	x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
	y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;

	// draw menu background
	draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

	//draw options
	for(var i = 0; i < op_lenght; i++)
	{
		var _c = c_white
		if pos == i {_c = c_yellow};
		draw_text_color(x+op_border, y+op_border + op_space*i, option[menu_level, i], _c, _c, _c, _c, 1);
	}
}