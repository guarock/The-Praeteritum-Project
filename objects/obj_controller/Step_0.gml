var esc_pressed = keyboard_check_pressed(vk_escape)
var enter_pressed = keyboard_check_pressed(vk_enter)
var move_ = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
var f_pressed = keyboard_check_pressed(vk_alt)

//Cursor move

if move_ != 0
{
	if cur_moved
	{
		move_ = 0
	}
	cur_moved = true
}
else
{
	cur_moved = false
}

//Fullscreen setting
if f_pressed
{
	window_set_fullscreen(not window_get_fullscreen())
}

//      MENU      //
if esc_pressed
{
	if global.game_state == states.playing
	{
		global.game_state = states.paused
		menu_open = true
	}
	else if global.game_state = states.paused
	{
		global.game_state = states.playing
		menu_open = false
	}
}

if menu_open
{

menu_index += move_

	if menu_index < 0
	{
		menu_index = opt_number - 1
	}
	else if menu_index > opt_number - 1
	{
		menu_index = 0
	}
	
	if enter_pressed
	{
		switch(menu_index)
		{
			case 0:
			global.game_state = states.playing
			instance_activate_all()
			break;
			
			case 1:
			game_restart()
			break;
			
			case 2:
			game_end()
			break;
		}
	}
}

//    GAME OVER    //
if global.game_state = states.gameover
{
	instance_deactivate_all(1)
	if enter_pressed
	{
		game_restart()
	}
}