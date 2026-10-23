if (global.paused) exit;
right_key = keyboard_check(vk_right) || keyboard_check(ord("D"));
left_key = keyboard_check(vk_left) || keyboard_check(ord("A"));
up_key = keyboard_check(vk_up) || keyboard_check(ord("W"));
down_key = keyboard_check(vk_down) || keyboard_check(ord("S"));

if keyboard_check(vk_shift)
{
	move_speed = 2
} 
else {
	move_speed = 1
}

//get xspeed and yspeed
xspeed = (right_key - left_key) * move_speed;
yspeed = (down_key - up_key) * move_speed;


//pause
if instance_exists(obj_pauser)
	{
	xspeed = 0;
	yspeed = 0;
	}

//set sprite
mask_index = sprite[DOWN]

if yspeed == 0
{
if xspeed > 0 {face = RIGHT};
if xspeed < 0 {face = LEFT};
}
if xspeed > 0 && face == LEFT {face = RIGHT};
if xspeed < 0 && face == RIGHT {face = LEFT};

if xspeed == 0
{
if yspeed < 0 {face = UP};
if yspeed > 0 {face = DOWN};
}
if yspeed > 0 && face == UP {face = DOWN};
if yspeed < 0 && face == DOWN {face = UP};
sprite_index = sprite[face];

//collision
if place_meeting(x + xspeed, y, obj_wall) == true 
	{
	xspeed = 0;
	}
	if place_meeting(x, y + yspeed, obj_wall) == true
	{
	yspeed = 0;
	}


//Move the player
x += xspeed;
y += yspeed;


//animate
if xspeed == 0 && yspeed == 0
{
	image_index = 0
}

//depth (objects= add in create once)
depth = -bbox_bottom;