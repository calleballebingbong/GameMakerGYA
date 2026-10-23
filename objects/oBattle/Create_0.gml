instance_deactivate_all(true);

units = [];
turn = 0;
turnCount = 0;
roundCount = 0;
battleWaitTimeFrames = 30;
battleWaitTimeRemaining = 0;
battleText = "";
currentUser = noone;
currentAction = -1;
currentTargets = noone;
unitTurnOrder = [];
unitRenderOrder = [];

//Make targeting cursor
cursor =
{
	activeUser: noone,
	activeTarget: noone,
	activeAction : -1,
	targetSide : -1,
	targetIndex : 0,
	targetAll : false,
	confirmDelay : 0,
	active : false
}


//make enemies
for (var i = 0; i < array_length(enemies); i++)
{
	enemyUnits[i] = instance_create_depth(x+250+(i*10), y+68+(i*20), depth-10, oBattleUnitEnemy, enemies[i]);
	array_push(units, enemyUnits[i]);
}

//make party
for (var i = 0; i < array_length(global.party); i++)
{
	partyUnits[i] = instance_create_depth(x+70+(i*10), y+68+(i*15), depth-10, oBattleUnitPC, global.party[i]);
	array_push(units, partyUnits[i]);
}

//shuffle turn order
unitTurnOrder = array_shuffle(units);

//get render order
RefreshRenderOrder = function()
{
	unitRenderOrder = [];
	array_copy(unitRenderOrder,0,units,0,array_length(units));
	array_sort(unitRenderOrder,function(_1, _2)
	{
		return _1.y - _2.y;
	});
}
RefreshRenderOrder();

function BattleStateAction()
{
		if (!instance_exists(oMenu))
		{
			//get current unit
			var _unit = unitTurnOrder[turn];
		
			//dead or cant act?
			if (!instance_exists(_unit)) || (_unit.hp <= 0)
			{
				battleState = BattleStateVictoryCheck;
				exit;
			}
		
			//select action to perform
			//BeginAction(_unit.id, global.actionLibrary.attack, _unit.id);
		
			//If unit player is controlled
			if (_unit.object_index == oBattleUnitPC)
			{
				//compile action menu
				var _menuOptions = [];
				var _subMenus = {};
				
				var _actionList = _unit.actions;
				
				for (var i = 0; i < array_length(_actionList); i++)
				{
					var _action = _actionList[i];
					var _available = true //add mp cost later
					var _namAndCount = _action.name; //modify later for items
					if (_action.subMenu == -1) //check for error on submenu-----
					{
						array_push(_menuOptions,[_namAndCount, MenuSelectAction, [_unit, _action], _available]);
					}
					else
					{
						//create or add to a submenu
						if (is_undefined(_subMenus[$ _action.subMenu]))
						{
							variable_struct_set(_subMenus, _action.subMenu, [[_namAndCount, MenuSelectAction, [_unit, _action], _available]]);
						}
						else
						{
							array_push(_subMenus[$ _action.subMenu], [_namAndCount, MenuSelectAction, [_unit, _action], _available]);
						}
					}

				}

				//turn sub menus into an array
				var _subMenusArray = variable_struct_get_names(_subMenus);
				for (var i = 0; i < array_length(_subMenusArray); i++)
				{
					//sort submenu?
					//here?
					
					//add back option at end of each submenu
					array_push(_subMenus[$ _subMenusArray[i]], ["Back", MenuGoBack, -1, true]);
					//add submenu into main menu
					array_push(_menuOptions, [_subMenusArray[i], SubMenu, [_subMenus[$ _subMenusArray[i]]], true]);
				}
			
				Menu(x+10, y+110, _menuOptions, , 74, 60);
			}
			else
			{
				//if unit is AI controlled
				var _enemyAction = _unit.AIscript();
				if (_enemyAction != -1) BeginAction(_unit.id, _enemyAction[0], _enemyAction[1]);
			}
		}
}

//start unit action
function BeginAction(_user, _action, _targets)
{
	currentUser = _user;
	currentAction = _action;
	currentTargets = _targets;
	battleText = string_ext(_action.description, [_user.name]);
	if (!is_array(currentTargets)) currentTargets = [currentTargets];
	battleWaitTimeRemaining = battleWaitTimeFrames;
	with (_user)
	{
		acting = true;
		//play user animation if defined for that action & user
		if (!is_undefined(_action[$ "userAnimation"])) && (!is_undefined(_user.sprites[$ _action.userAnimation]))
		{
			sprite_index = sprites[$ _action.userAnimation];
			image_index = 0;
		}
	}
	battleState = BattleStatePerformAction;
}

function BattleStatePerformAction()
{
	//if animation etc is still playing
	if (currentUser.acting)
	{
		//when it ends, perform action effect
		if (currentUser.image_index >= currentUser.image_number -1)
		{
			with (currentUser)
			{
				sprite_index = sprites.idle;
				image_index = 0;
				acting = false;
			}
			
			if (variable_struct_exists(currentAction, "effectSprite"))
			{
				if (currentAction.effectOnTarget == MODE.ALWAYS) || ( (currentAction.effectOnTarget == MODE.VARIES) && (array_length(currentTargets) <= 1) )
				{
					for (var i = 0; i < array_length(currentTargets); i++)
					{
						instance_create_depth(currentTargets[i].x,currentTargets[i].y,currentTargets[i].depth-1,oBattleEffect,{sprite_index : currentAction.effectSprite});
					}
				}
				else //play at 0,0
				{
					var _effectSprite = currentAction._effectSprite
					if (variable_struct_exists(currentAction, "effectSpriteNoTarget")) _effectSprite = currentAction.effectSpriteNoTarget;
					instance_create_depth(x,y,depth-100,oBattleEffect,{sprite_index : _effectSprite});
				}
			}
			currentAction.func(currentUser, currentTargets);
		}
	}
	else //wait for delay and then end turn
	{
		if(!instance_exists(oBattleEffect))
		{
			battleWaitTimeRemaining--
			if (battleWaitTimeRemaining == 0)
			{
				battleState = BattleStateVictoryCheck;
			}
		}
	}
}

function BattleStateVictoryCheck()
{
	RefreshPartyHealthOrder = function() {
		PartyUnitsByHP = []
		array_copy(PartyUnitsByHP,0,partyUnits,0,array_length(partyUnits));
		array_sort(PartyUnitsByHP,function(_1,_2){
			return _2.hp - _1.hp;	
		});
	}
	RefreshPartyHealthOrder();
	
	RefreshEnemyHealthOrder = function() {
		EnemyUnitsByHP = []
		array_copy(EnemyUnitsByHP,0,enemyUnits,0,array_length(enemyUnits));
		array_sort(EnemyUnitsByHP,function(_1,_2){
			return _2.hp - _1.hp;	
		});
	}
	RefreshEnemyHealthOrder();
	
		if (PartyUnitsByHP[0].hp <= 0)
		{
			room_goto(Centralhall);//change to gameobvver screen
		}
		
		if (EnemyUnitsByHP[0].hp <= 0)
		{
			for (var i = 0; i < array_length(global.party); i++)
			{
				global.party[i].hp = partyUnits[i].hp
			}
			instance_activate_all();
			instance_destroy(creator);
			instance_destroy();
		}
	
	battleState = BattleStateTurnProgression;
}

function BattleStateTurnProgression()
{
		battleText = ""; //reset battle text
		turnCount++; // total turns
		turn++;
		//loop turns
		if (turn > array_length(unitTurnOrder) - 1)
		{
			turn = 0;
			roundCount++;
		}
		battleState = BattleStateAction
}

battleState = BattleStateAction;