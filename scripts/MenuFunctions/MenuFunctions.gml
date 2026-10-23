/// @desc Menu - makes a menu, options provided in the form [["name", function, argument], [...]]
function Menu(_x, _y, _options, _description = -1, _width = undefined, _height = undefined)
{
	with (instance_create_depth(_x,_y,-99999,oMenu))
	{
		options = _options;
		description = _description;
		var _optionCount = array_length(_options);
		visibleOptionsMax = _optionCount;
		
		//set size
		xmargin = 10;
		ymargin = 8;
		draw_set_font(global.font_main);
		heightLine = 12;
		
		//auto width
		if (_width == undefined)
		{
			width = 1;
			if (description != -1) width = max(width, string_width(_description));
			for (var i = 0; i < _optionCount; i++)
			{
				width = max(width, string_width(_options[i][0]));
			}
			widthFull = width + xmargin * 2;
		} else widthFull = _width;
		
		//auto height
		if (_height == undefined)
		{
			height = heightLine * (_optionCount + !(description == -1));
			heightFull = height + ymargin * 2;
		}
		else
		{
			heightFull = _height;
			//scrolling?
			if (heightLine * (_optionCount + !(description == -1)) > _height - (ymargin*2))
			{
				scrolling = true;
				visibleOptionsMax = (_height - ymargin * 2) div heightLine;
			}
		}
	}
}

function SubMenu(_options)
{
	//store old options in array and increase sub menu level
	optionsAbove[subMenuLevel] = options;
	subMenuLevel++;
	options = _options;
	hover = 0;
}

function MenuGoBack()
{
	subMenuLevel--;
	options = optionsAbove[subMenuLevel];
	hover = 0;
}

function MenuSelectAction (_user, _action)
{
	with (oMenu) active = false;
	
	//Activate the targetting cursor if needed, or simply begin the action
	with (oBattle)
	{
		if (_action.targetRequired)
		{
			with(cursor)
			{
					active = true;
					activeAction = _action;
					targetAll = _action.targetAll;
					if (targetAll == MODE.VARIES) targetAll = true; //"toggle" start as
					activeUser = _user;
					
					//which side to target by default?
					if (_action.targetEnemyByDefault) 
					{
						targetIndex = 0;
						targetSide = oBattle.enemyUnits;
						activeTarget = oBattle.enemyUnits[targetIndex];
					}
					else //target self by default
					{
						targetSide = oBattle.partyUnits;
						activeTarget = activeUser;
						var _findSelf = function(_element)
						{
							return (_element == activeTarget)
						}
						targetIndex = array_find_index(oBattle.partyUnits, _findSelf);
					}
			}
		}
		else
		{
			// if no target needed, begin the action and end the menu
			BeginAction(_user,_action, -1);
			with(oMenu) instance_destroy();
		}
	}
}