audio_play_sound(snd_RadioStatic, 1, false)

if global.Score = -100 {
	global.Score = 0
	text = "Your family is dead due to your selfishness."
	face = spr_Radio
	exit
}

if round(global.Speed) > 5 {
	global.Score = 0
	text = "You crash landed! Everyone is dead."
	face = spr_Radio
	exit
}

if global.Score == 100 {
	text = "Congrats! You landed safely!"
} else {
	text = "You only saved " + string(global.Score) + "% of your family."
}

face = spr_Radio