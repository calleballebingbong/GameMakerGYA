//draw background
draw_sprite(battleBackground,0,x,y);

//Draw units in order of depth
var _unitWithCurrenTurn = unitTurnOrder[turn].id;
for (var i = 0; i < array_length(unitRenderOrder); i++)
{
	with (unitRenderOrder[i])
	{
		draw_self();
	}
}

//draw ui box
draw_sprite_stretched(spr_menu_battleBG,0,x+78,y+136,210,80);
draw_sprite_stretched(spr_menu_battleBG,0,x,y+136,76,80);


//positions
#macro COLUMN_ENEMY 25
#macro COLUMN_NAME 90
#macro COLUMN_HP 160
#macro COLUM_MP 220

//Draw headings
draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_gray);
draw_text(x+COLUMN_ENEMY,y+140,"ENEMY");
draw_text(x+COLUMN_NAME,y+140,"NAME");
draw_text(x+COLUMN_HP,y+140,"HP");
draw_text(x+COLUM_MP,y+140,"MP");

//Draw enemy names
draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
var _drawLimit = 3;
var _drawn = 0;
for (var i = 0; (i < array_length(enemyUnits)) && (_drawn < _drawLimit); i++)
{
	var _char = enemyUnits[i];
	if (_char.hp > 0)
	{
		_drawn++;
		draw_set_halign(fa_left);
		draw_set_color(c_white);
		if (_char.id == _unitWithCurrenTurn) {draw_set_color(c_yellow)};
		draw_text(x+COLUMN_ENEMY,y+150+(i*12),_char.name);
	}
}

//draw party info
for (var i = 0; i < array_length(partyUnits); i++)
{
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	var _char = partyUnits[i];
	if (_char.id == _unitWithCurrenTurn) draw_set_color(c_yellow);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_NAME,y+150+(i*12),_char.name);
	draw_set_halign(fa_right);
	
	draw_set_color(c_white);
	if (_char.hp < (_char.hpMax * 0.5)) draw_set_color(c_orange);
	if(_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_HP+50,y+150+(i*12),string(_char.hp) + "/" + string(_char.hpMax));
	
	draw_set_color(c_white);
	if (_char.mp < (_char.mpMax * 0.5)) draw_set_color(c_orange);
	if(_char.mp <= 0) draw_set_color(c_red);
	draw_text(x+COLUM_MP+50,y+150+(i*12),string(_char.mp) + "/" + string(_char.mpMax));
	
	draw_set_color(c_white);
}

//draw target cursor
if (cursor.active)
{
	with (cursor)
	{
		if(activeTarget != noone)
		{
			if (!is_array(activeTarget))
			{
				draw_sprite(spr_textbox_arrow,0,activeTarget.x,activeTarget.y);
			}
			else
			{
				draw_set_alpha(sin(get_timer()/50000)+1);
				for (var i = 0; i < array_length(activeTarget); i++)
				{
					draw_sprite(spr_textbox_arrow,0, activeTarget[i].x,activeTarget[i].y);
				}
				draw_set_alpha(1.0);
			}
		}
	}
}

//draw Battle Text
if (battleText != "")
{
	var _w = string_width(battleText)+20;
	draw_sprite_stretched(spr_menu_battleBG,0,x+160-(_w*0.5),y+5,_w,25);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(x+160,y+10,battleText);
}