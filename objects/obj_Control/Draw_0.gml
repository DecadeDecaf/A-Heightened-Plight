if global.Height < 100 && room == rm_Game {
	draw_set_alpha((100 - round(global.Height)) / 100)
	draw_rectangle(0, 0, 320, 180, false)
	draw_set_alpha(1)
} else if room == rm_Menu {
	draw_set_color(c_black)
	draw_text_ext(7, 130, "Your family's hot air balloon ride turned into a freefall after the balloon popped! Throw things out to release some weight and slow down, but make sure you only sacrifice what you absolutely must. You may end up needing something later. Good luck!", 16, 310)
	draw_text_ext(7, 131, "Your family's hot air balloon ride turned into a freefall after the balloon popped! Throw things out to release some weight and slow down, but make sure you only sacrifice what you absolutely must. You may end up needing something later. Good luck!", 16, 310)
	draw_text_ext(8, 131, "Your family's hot air balloon ride turned into a freefall after the balloon popped! Throw things out to release some weight and slow down, but make sure you only sacrifice what you absolutely must. You may end up needing something later. Good luck!", 16, 310)
	draw_set_color(c_white)
	draw_text_ext(8, 130, "Your family's hot air balloon ride turned into a freefall after the balloon popped! Throw things out to release some weight and slow down, but make sure you only sacrifice what you absolutely must. You may end up needing something later. Good luck!", 16, 310)
	draw_sprite(spr_Logo, 0, 220, 50)
}