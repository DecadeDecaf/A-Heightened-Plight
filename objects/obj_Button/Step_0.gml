if mouse_check_button_pressed(mb_left) && point_distance(0, y, 0, mouse_y) < 8 && mouse_x <= 160 {
	scr_PressButton()
	global.Interacting = -1
	if room == rm_Game {
		with obj_Button {
			instance_destroy()
		}
	}
} else if room == rm_Game && mouse_check_button_pressed(mb_left) && (mouse_y >= 80 || mouse_x > 160) {
	global.Interacting = -1
	instance_destroy()
}