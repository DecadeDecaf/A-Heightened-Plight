if type == "Talk." {
	var messages = ds_list_create()
	var speaker = spr_FatherHead
	if global.Interacting == obj_Mother {
		speaker = spr_MotherHead
		ds_list_add(messages, "How are we going to get down safely?")
		ds_list_add(messages, "Next time let's just go skiing.")
		ds_list_add(messages, "I can't believe you talked me into this.")
		ds_list_add(messages, "Make sure the kids are safe.")
		ds_list_add(messages, "Just stay calm. We'll get out of this.")
	} else if global.Interacting == obj_Brother {
		speaker = spr_BrotherHead
		ds_list_add(messages, "Ugh.")
		ds_list_add(messages, "I don't wanna talk, dad.")
		ds_list_add(messages, "...")
		ds_list_add(messages, "Sacrifices must be made.")
		ds_list_add(messages, "I knew I should've stayed home.")
	} else if global.Interacting == obj_Sister {
		speaker = spr_SisterHead
		ds_list_add(messages, "Why is it so windy, dad?")
		ds_list_add(messages, "I can't wait to get home!")
		ds_list_add(messages, "This is fun!")
		ds_list_add(messages, "I thought these were supposed to go up.")
		ds_list_add(messages, "What's happening?")
	}
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	dialogue.text = ds_list_find_value(messages, irandom_range(0, ds_list_size(messages) - 1))
	dialogue.face = speaker
	ds_list_destroy(messages)
} else if type == "Pet." {
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	dialogue.text = "Bark."
	dialogue.face = spr_DogHead
} else if type == "Trash duty!" {
	var messages = ds_list_create()
	var speaker = spr_FatherHead
	if global.Interacting == obj_Mother {
		speaker = spr_MotherHead
		ds_list_add(messages, "My pleasure.")
		ds_list_add(messages, "Sure thing.")
		ds_list_add(messages, "Why not?")
	} else if global.Interacting == obj_Brother {
		speaker = spr_BrotherHead
		ds_list_add(messages, "Fine.")
		ds_list_add(messages, "Whatever.")
		ds_list_add(messages, "Ugh, okay.")
	} else if global.Interacting == obj_Sister {
		speaker = spr_SisterHead
		ds_list_add(messages, "Gross!")
		ds_list_add(messages, "Ew!")
		ds_list_add(messages, "Aw man.")
	}
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	dialogue.text = ds_list_find_value(messages, irandom_range(0, ds_list_size(messages) - 1))
	dialogue.face = speaker
	ds_list_destroy(messages)
	if global.Interacting == obj_Mother {
		global.Trash -= 2
		global.Trash = max(0, global.Trash)
	} else {
		global.Trash -= 1
	}
	audio_play_sound(snd_Trash, 1, false)
} else if type == "Offer the parachute." {
	var speaker = spr_FatherHead
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	if global.Interacting == obj_Mother {
		speaker = spr_MotherHead
		dialogue.text = "Hope to see you soon."
	} else if global.Interacting == obj_Brother {
		speaker = spr_BrotherHead
		dialogue.text = "Finally, thanks."
	} else if global.Interacting == obj_Sister {
		speaker = spr_SisterHead
		dialogue.text = "It's scary, but I trust you!"
	}
	dialogue.face = speaker
	global.Interacting.saved = true
	global.Parachute = false
	audio_play_sound(snd_Drop, 1, false)
} else if type == "Leave your family behind." {
	global.Score = -100
	room_goto(rm_End)
} else if type == "Release from balloon." {
	if global.Interacting == obj_Mother {
		global.Mother = false
		var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
		dialogue.text = "Ahhhhh!"
		dialogue.face = spr_MotherHead
	} else if global.Interacting == obj_Brother {
		global.Brother = false
		var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
		dialogue.text = "Why me?!"
		dialogue.face = spr_BrotherHead
	} else if global.Interacting == obj_Sister {
		global.Sister = false
		var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
		dialogue.text = "Daddy no!!"
		dialogue.face = spr_SisterHead
	} else if global.Interacting == obj_Dog {
		global.Dog = false
	} else if global.Interacting == obj_Medkit {
		global.Medkit = false
	} else if global.Interacting == obj_Telephone {
		global.Telephone = false
	} else if global.Interacting == obj_Radio {
		global.Radio = false
	} else if global.Interacting == obj_Extinguisher {
		global.Extinguisher = false
	} else if global.Interacting == obj_Parachute {
		global.Parachute = false
	} else if global.Interacting == obj_Note {
		global.Note = false
	} else if global.Interacting == obj_Anvil {
		if global.Mother && global.Brother && global.Sister && !obj_Mother.saved && !obj_Brother.saved && !obj_Sister.saved {
			global.Anvil = false
		} else {
			var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
			dialogue.text = "It's too heavy! We need four people to lift it."
			dialogue.face = spr_FatherHead
			exit
		}
	} else if global.Interacting == obj_Package {
		with obj_Package {
			instance_destroy()
		}
	} else if global.Interacting == obj_Trash {
		global.Trash = 0
		global.TrashBin = false
		var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
		dialogue.text = "Now we can't organize our trash!"
		dialogue.face = spr_FatherHead
	}
	audio_play_sound(snd_Drop, 1, false)
} else if type == "Release some from balloon." {
	if global.Interacting == obj_Food {
		global.Food -= 1
	} else if global.Interacting == obj_Water {
		global.Water -= 1
	} else if global.Interacting == obj_Gum {
		global.Gum -= 1
	}
	audio_play_sound(snd_Drop, 1, false)
} else if type == "Open." {
	repeat 1000 {
		var item = irandom_range(1, 9)
		if item == 1 && !global.Telephone {
			global.Telephone = true
			break
		} else if item == 2 && !global.Radio {
			global.Radio = true
			break
		} else if item == 3 && !global.Medkit {
			global.Medkit = true
			break
		} else if item == 4 && !global.Extinguisher {
			global.Extinguisher = true
			break
		} else if item == 5 && !global.Parachute {
			global.Parachute = true
			break
		} else if item == 6 && !global.Anvil {
			global.Anvil = true
			break
		} else if item == 7 {
			global.Food += 3
			break
		} else if item == 8 {
			global.Water += 3
			break
		} else if item == 9 {
			global.Gum += 2
			break
		}
	}
	with obj_Package {
		instance_destroy()
	}
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	dialogue.text = "Look what I found!"
	dialogue.face = spr_FatherHead
	audio_play_sound(snd_Trash, 1, false)
} else if type == "Ration food." {
	global.Food -= 1
	global.Trash += 1
	with par_Family {
		hungry = false
		starving = false
	}
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	dialogue.text = choose("Eat up.", "Dig in.", "Chow down.")
	dialogue.face = spr_FatherHead
	audio_play_sound(snd_Food, 1, false)
} else if type == "Ration water." {
	global.Water -= 1
	global.Trash += 1
	with par_Family {
		thirsty = false
		parched = false
	}
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	dialogue.text = choose("Drink up.", "Water time.", "Stay hydrated.")
	dialogue.face = spr_FatherHead
	audio_play_sound(snd_Water, 1, false)
} else if type == "Ration gum." {
	global.Gum -= 1
	global.Trash += 1
	with par_Family {
		hungry = false
		starving = false
		thirsty = false
		parched = false
	}
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	dialogue.text = "Hopefully that will hold us over."
	dialogue.face = spr_FatherHead
	audio_play_sound(snd_Food, 1, false)
	audio_play_sound(snd_Water, 1, false)
} else if type == "Tend to wounds." {
	global.Trash += 2
	with par_Family {
		hurt = false
		alarm[0] = -1
	}
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	dialogue.text = choose("Feeling better?", "That'll fix you right up!", "There we go, all better.")
	dialogue.face = spr_FatherHead
	audio_play_sound(snd_Medkit, 1, false)
} else if type == "Put out fires." {
	with par_Item {
		flamed = false
	}
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	dialogue.text = choose("Phew!", "Situation has been handled.", "What would I do without this?")
	dialogue.face = spr_FatherHead
} else if type == "Call for supplies." {
	global.TelephoneCooldown = 1800
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	dialogue.text = choose("Could we get a little help?", "We could use some assistance.", "S.O.S.")
	dialogue.face = spr_Telephone
	instance_create_depth(-30, 30, -18, obj_PackageBird)
	audio_play_sound(snd_PhoneRing, 1, false)
} else if type == "Dig through." {
	global.TrashCooldown = 1200
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	var trash = irandom_range(1, 5)
	if trash == 5 && global.Telephone && global.Radio {
		trash = 1
	}
	if trash == 1 {
		dialogue.text = "Couldn't find anything."
	} else if trash == 2 {
		dialogue.text = "This food is probably still good."
		global.Food += 1
		global.Trash -= 1
	} else if trash == 3 {
		dialogue.text = "This water is probably still good."
		global.Water += 1
		global.Trash -= 1
	} else if trash == 4 {
		dialogue.text = "This gum is probably still good."
		global.Gum += 1
		global.Trash -= 1
	} else if trash == 5 {
		dialogue.text = "Look what I found!"
		global.Trash -= 1
		repeat 1000 {
			var item = irandom_range(1, 2)
			if item == 1 && !global.Telephone {
				global.Telephone = true
				break
			} else if item == 2 && !global.Radio {
				global.Radio = true
				break
			}
		}
	}
	dialogue.face = spr_FatherHead
	audio_play_sound(snd_Trash, 1, false)
} else if type == "Check height." {
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	dialogue.text = "You are currently " + string(round(global.Height)) + "ft from the ground."
	dialogue.face = spr_Radio
	audio_play_sound(snd_RadioStatic, 1, false)
} else if type == "Check speed." {
	var assessment = "That's too fast!"
	if round(global.Speed) <= 5 {
		var assessment = "You're cutting it close."
	}
	if round(global.Speed) <= 4 {
		var assessment = "You should be fine."
	}
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	dialogue.text = "You are moving at " + string(round(global.Speed)) + "mph. " + assessment
	dialogue.face = spr_Radio
	audio_play_sound(snd_RadioStatic, 1, false)
} else if type == "Read." {
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	dialogue.text = "Made in 3 days for Ludum Dare 43."
	dialogue.face = spr_Note
	global.Note = false
	global.Trash += 1
	audio_play_sound(snd_Paper, 1, false)
} else if type == "Start over." {
	game_restart()
} else if type == "Fullscreen." {
	if window_get_fullscreen() {
		window_set_fullscreen(false)
		window_set_size(960, 540)
	} else {
		window_set_fullscreen(true)	
	}
} else if type == "Mute." {
	if !global.Muted {
		audio_master_gain(0)
		global.Muted = true
	} else {
		audio_master_gain(1)
		global.Muted = false
	}
} else if type == "Start." {
	room_goto(rm_Game)
} else if type == "Exit." {
	game_end()
}