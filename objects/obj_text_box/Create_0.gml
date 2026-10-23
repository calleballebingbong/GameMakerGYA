//textbox parameters
textbox_width = 200;
textbox_height = 64;
border = 8;
line_sep = 12;
line_width = textbox_width - border*2;
textb_img = 0;
textb_img_speed = 6/60;

//text
page = 0;
page_number = 0;
//input text
text[0] = "";
text_lenght[0] = string_length(text[0]);
char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;
draw_char = 0;
text_speed = 1;
//text options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

setup = false;


//sound
snd_delay = 5;
snd_count = snd_delay;

//effects
scr_set_defaults_for_text();
last_free_space = 0;
text_pause_timer =0;
text_pause_time = 16;