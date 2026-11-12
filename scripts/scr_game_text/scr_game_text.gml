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

	case "f4_hallway_teacher":
	if (!global.teacher1spoken){
		scr_text("You are very late... go take the exam in classroom 4244 immediately","f4_hallway_teacher")
		global.teacher1spoken = true;
		break;
	} 
	else {
		scr_text("Have you taken the exam? If not then GET TO WORK!!!", "f4_hallway_teacher")
		break;
	}
	
	case "f4_fake_teacher":
	if (!global.fakeTeacherDefeated){
	scr_text("Have you come to take your exam?", "f4_fake_teacher")
	scr_option("Yes", "f4_fake_teacher_yes")
	scr_option("No", "f4_fake_teacher_no")
	break;
	} else{
		scr_text("Leave me alone... I just wanted your lunch anyways.", "f4_fake_teacher")
		scr_text("Your real exam is in classroom 4247.", "f4_fake_teacher")
		break;
	}
	
	case "f4_fake_teacher_yes":
	scr_text("WELL TOOOOO BAD... I am a TIBBLE STUDENT, THERE IS NO EXAM...", "f4_fake_teacher")
	scr_text("Or... there is.", "f4_fake_teacher")
	scr_text("Just not in here.", "f4_fake_teacher")
	scr_text("Its actually in classroom 4247.", "f4_fake_teacher")
	scr_text("But never mind that, YOU WONT MAKE IT OUT OF HERE!!!", "f4_fake_teacher")
	scr_option("Okay buddy bring it on!","fakeFight_start")
	break;
	
	case "fakeFight_start":
	if(!global.fakeTeacherDefeated){
	NewEncounter([global.enemies.Monster1, global.enemies.Monster2], spr_bg_test, "f4_fake_teacher")
	global.fakeTeacherDefeated = true;
	break;
	} else {
		scr_text("Log out pal.", "f4_fake_teacher")
		break;
	}
	
	case "f4_fake_teacher_no":
	scr_text("If you are not going to take the exam then LEAVE.", "f4_fake_teacher")
	break;
	
	case "f4_exam_teacher":
	if (!global.examPass){
		scr_text("You finally came to take your exam i see. Lets get straight to it.", "f4_exam_teacher")
		scr_text("What is 8 times 8?", "f4_exam_teacher")
		scr_option("64", "exam1")
		scr_option("81", "exam_fail")
		scr_option("16", "exam_fail")
		break;
	} else{
		scr_text("You passed!!! now get out.", "f4_exam_teacher")
		break;
	}
	
	case "exam1":
	scr_text("Correct!", "f4_exam_teacher")
	scr_text("Now how many degrees does a triangle have?", "f4_exam_teacher")
	scr_option("360", "exam_fail")
	scr_option("180", "exam2")
	scr_option("90", "exam_fail")
	break;
	
	case "exam2":
	scr_text("Great!!! Now for the final question.", "f4_exam_teacher")
	scr_text("What is X?", "f4_exam_teacher")
	global.show_exam_question = true;
	scr_option("16", "exam_fail")
	scr_option("There is no X???", "exam3")
	scr_option("26", "exam_fail")
	break;
	
	case "exam3":
	global.show_exam_question = false;
	scr_text("Damn right. There is not X there, mb gng.", "f4_exam_teacher")
	scr_text("But anyways, YOU PASS!!!", "f4_exam_teacher")
	global.examPass = true;
	break;
	
	case "exam_fail":
	global.show_exam_question = false;
	scr_text("You got that one wrong... you FAIL. But you can try again", "f4_exam_teacher")
	break;
}

}