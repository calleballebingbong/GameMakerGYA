depth = -9999;

if (instance_number(obj_item_manager) > 1 && instance_find(obj_item_manager, 0) != id)
{
	instance_destroy();
	exit;
}

persistent = true;
GameData();
global.enemy1Defeated = false;

global.itemCatalog =
{
	potion:
	{
		name: "Potion",
		description: "Restores up to 20 HP.",
		Use: function(_target)
		{
			if (!instance_exists(_target)) return false;
			if (_target.hp <= 0) return false;
			if (_target.hp >= _target.hpMax) return false;

			var _healing = min(20, _target.hpMax - _target.hp);
			BattleChangeHP(_target, _healing);
			return true;
		}
	}
};

global.inventory = {};

global.itemManager =
{
	Count: function(_itemId)
	{
		if (!variable_struct_exists(global.itemCatalog, _itemId)) return 0;
		if (!variable_struct_exists(global.inventory, _itemId)) return 0;
		return global.inventory[$ _itemId];
	},

	Add: function(_itemId, _amount = 1)
	{
		if (!variable_struct_exists(global.itemCatalog, _itemId))
		{
			show_debug_message("Cannot add unknown item: " + string(_itemId));
			return false;
		}
		if (!is_real(_amount) || _amount <= 0 || floor(_amount) != _amount)
		{
			show_debug_message("Item amounts must be positive whole numbers.");
			return false;
		}

		var _count = global.itemManager.Count(_itemId);
		variable_struct_set(global.inventory, _itemId, _count + _amount);
		return true;
	},

	Remove: function(_itemId, _amount = 1)
	{
		if (!variable_struct_exists(global.itemCatalog, _itemId))
		{
			show_debug_message("Cannot remove unknown item: " + string(_itemId));
			return false;
		}
		if (!is_real(_amount) || _amount <= 0 || floor(_amount) != _amount)
		{
			show_debug_message("Item amounts must be positive whole numbers.");
			return false;
		}

		var _count = global.itemManager.Count(_itemId);
		if (_count < _amount) return false;
		variable_struct_set(global.inventory, _itemId, _count - _amount);
		return true;
	},

	Use: function(_itemId, _target)
	{
		if (!variable_struct_exists(global.itemCatalog, _itemId))
		{
			show_debug_message("Cannot use unknown item: " + string(_itemId));
			return false;
		}
		if (global.itemManager.Count(_itemId) <= 0) return false;

		var _item = global.itemCatalog[$ _itemId];
		if (!_item.Use(_target)) return false;

		global.itemManager.Remove(_itemId);
		return true;
	}
};