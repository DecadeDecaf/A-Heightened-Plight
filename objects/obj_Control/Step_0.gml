//Update Game Logic

if room == rm_Game {
	scr_Update()
	}

//Fullscreen

if keyboard_check_pressed(ord("F")) || keyboard_check_pressed(vk_escape) {
	if window_get_fullscreen() {
		window_set_fullscreen(false)
		window_set_size(960, 540)
	} else {
		window_set_fullscreen(true)	
	}
}

if !window_get_fullscreen() && window_get_width() != 940 {
	window_set_size(960, 540)	
}

if keyboard_check_pressed(ord("M")) {
	if !global.Muted {
		audio_master_gain(0)
		global.Muted = true
	} else {
		audio_master_gain(1)
		global.Muted = false
	}
}