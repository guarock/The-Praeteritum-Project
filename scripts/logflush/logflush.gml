function logflush(arg0)
{
global.logfileFilename = "game-log-"+string(date_current_datetime()) + ".txt";
show_debug_message(string(date_current_datetime()));
global.logfile = file_text_open_append(global.logfileFilename);
///debug_log(string);
file_text_write_string(global.logfile, string(arg0));
file_text_writeln(global.logfile);
file_text_close(global.logfile);

show_debug_message(arg0);
}