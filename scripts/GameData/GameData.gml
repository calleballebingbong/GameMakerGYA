//action library
global.actionLibrary =
{
	attack:
	{
		name : "Attack",
		description : "{0} attacks!",
		subMenu : -1,
		targetRequired : true,
		targetEnemyByDefault : true,
		targetAll : MODE.NEVER,
		userAnimation : "attack",
		effectSprite : spr_attackeffect,
		effectOnTarget : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
			BattleChangeHP(_targets[0], -_damage, 0);
		}	
	},
	ice :
	{
		name : "Ice",
		description : "{0} cast Ice!",
		subMenu : "Magic",
		mpCost : 4,
		targetRequired : true,
		targetEnemyByDefault : true, //0: party/self, 1: enemy
		targetAll : MODE.VARIES,
		userAnimation : "attack",
		effectSprite : spr_attackeffect,
		effectOnTarget : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = irandom_range(10, 15);
			BattleChangeHP(_targets[0], -_damage);
			//BattleChangeMP(_user, -mpCost);
		}
	},
	fire :
	{
		name : "Fire",
		description : "{0} cast Ice!",
		subMenu : "Magic",
		mpCost : 4,
		targetRequired : true,
		targetEnemyByDefault : true, //0: party/self, 1: enemy
		targetAll : MODE.VARIES,
		userAnimation : "attack",
		effectSprite : spr_attackeffect,
		effectOnTarget : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = irandom_range(10, 15);
			BattleChangeHP(_targets[0], -_damage);
			//BattleChangeMP(_user, -mpCost);
		}
	},
	item :
	{
		name : "Testitem1",
		description : "{0} item!",
		subMenu : "items",
		mpCost : 4,
		targetRequired : true,
		targetEnemyByDefault : false, //0: party/self, 1: enemy
		targetAll : MODE.NEVER,
		userAnimation : "attack",
		effectSprite : spr_attackeffect,
		effectOnTarget : MODE.ALWAYS,
	}
	
	
}

enum MODE
{
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2
}

//party data
global.party =
[

	{
		name: "You",
		hp: 89,
		hpMax: 89,
		mp: 10,
		mpMax: 15,
		strength: 6,
		sprites: {idle: spr_player_down, attack: spr_player_right, defend: spr_player_left, down: spr_player_up},
		actions : [global.actionLibrary.attack, global.actionLibrary.ice,global.actionLibrary.fire, global.actionLibrary.item]
	}
];


//enemy data
global.enemies =
{
	Monster1:
	{
		name: "monster1",
		hp: 30,
		hpMax: 30,
		mp: 0,
		mpMax: 0,
		strength: 5,
		sprites: {idle: spr_player_down, attack: spr_player_right, defend: spr_player_left, down: spr_player_up},
		actions : [global.actionLibrary.ice],
		xpValue: 15,
		AIscript: function()
		{
			//attack random party member
			var _action = actions[0];
			var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index)
			{
				return(_unit.hp > 0);
			});
			var _target = _possibleTargets[irandom(array_length(_possibleTargets)-1)];
			return [_action, _target];
		}
	}
	,
	Monster2:
	{
		name: "monster2",
		hp: 20,
		hpMax: 20,
		mp: 0,
		mpMax: 0,
		strength: 2,
		sprites: {idle: spr_speak_block, attack: spr_player_right, defend: spr_player_left, down: spr_player_up},
		actions : [global.actionLibrary.attack],
		xpValue: 10,
		AIscript: function()
		{
			//attack random party member
			var _action = actions[0];
			var _possibleTargets = array_filter(oBattle.partyUnits, function(_unit, _index)
			{
				return(_unit.hp > 0);
			});
			var _target = _possibleTargets[irandom(array_length(_possibleTargets)-1)];
			return [_action, _target];
		}
	}
}