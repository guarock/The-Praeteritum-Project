global.pause       = true;
global.wiew_width  = camera_get_view_width(view_camera[0]);
global.view_heigth = camera_get_view_height(view_camera[0]);

global.key_revert  = ord("X");
global.key_enter   = vk_enter
global.key_left    = vk_left
global.key_right   = vk_right
global.key_up      = vk_up
global.key_down    = vk_down

display_set_gui_size(global.view_width, global.view_heigth);

enum menu_page  {
	menu,
	settings,
	audio,
	difficulty,
	graphics,
	controls,
	height,
}

enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input,
}

//CREATE MENU PAGES
ds_menu_main = create_menu_page(
   ["RESUME",        menu_element_type.script_runner,  resume_game],
   
	 

