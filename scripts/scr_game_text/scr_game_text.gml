/// @param text_id
function scr_game_text(_text_id){
switch(_text_id) {
	
	

	case "NPC 1":
		scr_text("yo wsg! my name is gurt!", "npc");
			scr_text_float(19, 24) // to float text
			scr_text_color(19, 24, c_yellow, c_yellow, c_yellow, c_yellow); // to change color of text
			scr_text_shake(0,7) // shake text
			scr_option("Yogurt", "NPC 1 - Gurt");
			scr_option("Sybau", "NPC 1 - SYBAU");
		break;
		
	case "NPC 1 - Gurt":
		scr_text("YO!", "npc")
		break;
		
	case "NPC 1 - SYBAU":
		scr_text("KYS", "npc")
		scr_text_color(0, 3, c_red, c_red, c_red, c_red)
		break;
		
		
		
		
		
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
	
	case "Pubert":
		scr_text("Hi! I'm Pubert", "Pubert");
			scr_text_float(0, 10) // to float text
			scr_text_color(0, 15, c_yellow, c_yellow, c_yellow, c_yellow); // to change color of text
			scr_text_shake(0,7) // shake text
		break;
}

}