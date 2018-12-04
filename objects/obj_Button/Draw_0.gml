if point_distance(0, y, 0, mouse_y) < 8 && mouse_x <= 160 {
	draw_set_color(c_black)
	draw_text(x - 1, y + 1, "    " + type)
	draw_text(x, y + 1, "    " + type)
	draw_text(x - 1, y, "    " + type)
	draw_set_color(c_white)
	draw_text(x, y, "    " + type)
} else {
	draw_set_color(c_black)
	draw_text(x - 1, y + 1, type)
	draw_text(x, y + 1, type)
	draw_text(x - 1, y, type)
	draw_set_color(c_white)
	draw_text(x, y, type)
}