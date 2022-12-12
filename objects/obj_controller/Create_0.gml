//GAME STATES 
enum states {
	playing,
	paused,
	gameover
}

global.game_state = states.playing

//MENU
options = ["RESUME", "RESTART", "QUIT"]
opt_number = array_length(options)
menu_index = 0
cur_moved = false
menu_open = false

//resolution
var width = 1280
var height = 720
display_set_gui_size(width, height)
