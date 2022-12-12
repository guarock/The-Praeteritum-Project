//    SCREEN SETTINGS    //
var cam_w = display_get_gui_width()
var cam_h = display_get_gui_height()
if global.game_state = states.playing
exit
// DRAW MENU //
if  menu_open
{
	draw_set_alpha(0.5)
	draw_set_color(c_black)
	draw_rectangle(0, 0, cam_w, cam_h, 0)
	
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_set_font(f_one)
	draw_text(cam_w/2, cam_h/2, "PAUSED")
	
	for ( var i = 0; i < opt_number; i++ )
	{
		if menu_index == i
		{
			draw_set_color(c_red)
		}
		else
		{
			draw_set_color(c_white)
		}
		draw_text(cam_w - 200, cam_h - 200 + 30 * i, options[i])
	}
}

// draw game over screen //
if global.game_state == states.gameover
{
	draw_set_color(c_black)
	draw_rectangle(0, 0, cam_w, cam_h, 0)
	
	draw_set_color(c_white)
	draw_set_font(f_one)
	
	draw_text(cam_w/2, cam_h/2, "GAME OVER")
	
}