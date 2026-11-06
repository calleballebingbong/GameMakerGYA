/// @param text_id
function scr_game_text(_text_id){
switch(_text_id) {
	


	case "Punk":
	if (!global.punkQuest){
		scr_text("Hey fresh meat!", "Punk");
			scr_text_color(5,17, c_red, c_red, c_red, c_red)
		scr_text("Yeah you, what do you want?", "Punk");
			scr_option("I need to get through", "Punk-through");
			scr_option("Nevermind", "Punk-nvm");
		break;
	}
	else if (global.punkQuest && global.punkDoor){
		scr_text("Fine, Come on through.", "Punk")
		global.doorUnlocked = true
		break;
	}
	else {
		scr_text("Comeback when you have what I need.", "Punk")
		break;
	}
		
	case "Punk-through":
		if (!global.punkQuest){
		scr_text("Fat chance, unless you have something of worth to me.", "Punk")
		scr_text("My rival is by the kiosk, show him whos boss and ill maybe let you through.", "Punk")
		scr_text_color(19,24, c_yellow, c_yellow, c_yellow, c_yellow)
		scr_text_float(19,24)
		global.punkQuest = true;
		break;
		}
		
	case "Punk-nvm":
		if (!global.punkDoor){
		scr_text("Quit wasting my time.", "Punk")
		global.punkDoor = true
		break;
		}
		
	
		
		
	case "NPC 2":
		scr_text("gurt:yo", "player");
		scr_text("To gurt or not to gurt? that is the question.....", "npc");
		scr_text("Maybe.....The real gurt was the friends we made along the way?", "player");
		scr_text("anyways! are you a sigma?", "player");
			scr_option("Yeah, im a sigma gooner!", "NPC 2 - yes");
			scr_option("No, im a beta empl*yed w*rker....", "NPC 2 - no");
		break;
		
	case "NPC 2 - yes":
		scr_text("Wgyat, what a sigma!", "npc");
		global.man_visible = true;
		scr_text("Youre now invited to my goon off!", "player happy");
		break;
		
	case "NPC 2 - no":
		scr_text("*The gooner turned its back to you....");
		break;
		
	case "Vidar" :
	scr_text("Yo wassup, my name is Vidar, Vidar Berg!", "Vidar");
	scr_text("How are you feeling today?", "Vidar");
	scr_option("Im feeling great!", "Vidar - Good")
	scr_option("I feel like crap", "Vidar - Bad")
	break;
	
	case "Vidar - Good" :
	scr_text("Thats very good to hear!", "Vidar");
	scr_text("Anyways, ya wanna guess how im feelin'?", "Vidar");
	scr_option("Horrible.", "Vidar - Horrible");
	scr_option("Uhh- Great?", "Vidar - Great");
	scr_option("TIPTOP!", "Vidar - Tiptop");
	break;
	
	case "Vidar - Bad" :
	scr_text("Uhh thats not very good.", "Vidar");
	scr_text("Anyways, ya wanna guess how im feelin'?", "Vidar");
	scr_option("Horrible.", "Vidar - Horrible");
	scr_option("Uhh- Great?", "Vidar - Great");
	scr_option("TIPTOP!", "Vidar - Tiptop");
	scr_text_color(0, 11, c_yellow, c_yellow, c_yellow, c_yellow);
	break;
	
	case "Vidar - Horrible" :
	scr_text("You wish!", "Vidar");
	break;
	
	case "Vidar - Great" :
	scr_text("Type Shiii", "Vidar");
	break;
	
	case "Vidar - Tiptop" :
	global.VidarShow = true
	scr_text("YA KNOW IT!", "Vidar");
	break;
	
	case "Guide":
		scr_text("Hi! I'm Pubert", "Guide");
			scr_text_float(0, 15) // to float text
			scr_text_color(0, 15, c_yellow, c_yellow, c_yellow, c_yellow); // to change color of text
			scr_text_shake(0,7) // shake text
			scr_option("Hi Pubert!", "Guide-Hi")
			scr_option("Bye", "Guide-Bye")
		break;
		
	case "Guide-Hi":
		scr_text("Welcome to AVA Gymnasium! I'll be your guide, feel free to take a look around!", "Guide");
		break;
		
	case "Guide-Bye":
		scr_text("Rude", "Guide")
		scr_text_color(0,5, c_red, c_red, c_red, c_red)
		break;
		
	case "Enemy1":
		scr_text("You wanna mess with me?","Enemy1")
		scr_option("Yes", "Enemy1Y")
		break;
	case "Enemy1Y":
		if (!global.enemy1Defeated){
		NewEncounter([global.enemies.Monster1, global.enemies.Monster2], spr_bg_test, "Enemy1")
		global.punkDoor = true
		break;
		}
		else{
		scr_text("You bested me!", "Enemy1")
		break;
		}
	
	case "Locked":
		scr_text("The door is locked.")
	break;

}

}