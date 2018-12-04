if exists && !saved && global.Interacting == -1 && mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id) {
	global.Interacting = object_index
	scr_Interactions()
}