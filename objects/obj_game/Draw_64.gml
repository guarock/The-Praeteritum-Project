if paused = true
{
	draw_set_color(c_black)
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false)
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_halign(fa_middle)
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "Paused")
}