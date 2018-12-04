var buttons = ds_list_create()

if global.Interacting == obj_Mother || global.Interacting == obj_Brother || global.Interacting == obj_Sister {
	ds_list_add(buttons, "Talk.")
	if global.Trash > 0 && global.TrashBin {
		ds_list_add(buttons, "Trash duty!")
	}
	if global.Parachute {
		ds_list_add(buttons, "Offer the parachute.")
	}
	ds_list_add(buttons, "Release from balloon.")
}

if global.Interacting == obj_Dog {
	ds_list_add(buttons, "Pet.")
	ds_list_add(buttons, "Release from balloon.")
}

if global.Interacting == obj_Food {
	if global.Food > 0 {
		var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
		if global.Food == 1 {
			dialogue.text = "We have 1 bar of food left."
		} else {
			dialogue.text = "We have " + string(global.Food) + " bars of food left."
		}
		dialogue.face = spr_FatherHead
		if obj_Mother.hungry || obj_Brother.hungry || obj_Sister.hungry {
			ds_list_add(buttons, "Ration food.")
		}
		ds_list_add(buttons, "Release some from balloon.")
	} else {
		var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
		dialogue.text = "We're out of food!"
		dialogue.face = spr_FatherHead
		global.Interacting = -1
	}
	audio_play_sound(snd_InteractSoft, 1, false)
}

if global.Interacting == obj_Water {
	if global.Water > 0 {
		var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
		if global.Water == 1 {
			dialogue.text = "We have 1 bottle of water left."
		} else {
			dialogue.text = "We have " + string(global.Water) + " bottles of water left."
		}
		dialogue.face = spr_FatherHead
		if obj_Mother.thirsty || obj_Brother.thirsty || obj_Sister.thirsty {
			ds_list_add(buttons, "Ration water.")
		}
		ds_list_add(buttons, "Release some from balloon.")
	} else {
		var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
		dialogue.text = "We're out of water!"
		dialogue.face = spr_FatherHead
		global.Interacting = -1
	}
	audio_play_sound(snd_InteractSoft, 1, false)
}

if global.Interacting == obj_Gum {
	if global.Gum > 0 {
		var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
		if global.Gum == 1 {
			dialogue.text = "We have 1 stick of gum left."
		} else {
			dialogue.text = "We have " + string(global.Gum) + " sticks of gum left."
		}
		dialogue.face = spr_FatherHead
		if obj_Mother.hungry || obj_Brother.hungry || obj_Sister.hungry || obj_Mother.thirsty || obj_Brother.thirsty || obj_Sister.thirsty {
			ds_list_add(buttons, "Ration gum.")
		}
		ds_list_add(buttons, "Release some from balloon.")
	} else {
		var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
		dialogue.text = "We're out of gum!"
		dialogue.face = spr_FatherHead
		global.Interacting = -1
	}
	audio_play_sound(snd_InteractSoft, 1, false)
}

if global.Interacting == obj_Trash {
	var dialogue = instance_create_depth(16, 164, -20, obj_Dialogue)
	if obj_Trash.flamed {
		dialogue.text = "It's on fire!"
		global.Interacting = -1
	} else if global.Trash == 0 {
		dialogue.text = "It's empty."
		ds_list_add(buttons, "Release from balloon.")
	} else if global.Trash == 1 {
		dialogue.text = "There is 1 lb of trash in there."
		ds_list_add(buttons, "Release from balloon.")
	} else {
		dialogue.text = "There are  " + string(global.Trash) + " lbs of trash in there."
		if global.TrashCooldown <= 0 {
			ds_list_add(buttons, "Dig through.")
		}
		ds_list_add(buttons, "Release from balloon.")
	}
	dialogue.face = spr_FatherHead
	audio_play_sound(snd_InteractMetal, 1, false)
}

if global.Interacting == obj_Medkit {
	if obj_Mother.hurt || obj_Brother.hurt || obj_Sister.hurt {
		ds_list_add(buttons, "Tend to wounds.")
	}
	ds_list_add(buttons, "Release from balloon.")
	audio_play_sound(snd_InteractSoft, 1, false)
}

if global.Interacting == obj_Extinguisher {
	var fire = false
	with par_Item {
		if flamed {
			with other {
				fire = true
			}
		}
	}
	if fire {
		ds_list_add(buttons, "Put out fires.")
	}
	ds_list_add(buttons, "Release from balloon.")
	audio_play_sound(snd_InteractMetal, 1, false)
}

if global.Interacting == obj_Telephone {
	if global.TelephoneCooldown <= 0 {
		ds_list_add(buttons, "Call for supplies.")
	}
	ds_list_add(buttons, "Release from balloon.")
	audio_play_sound(snd_InteractHard, 1, false)
}

if global.Interacting == obj_Radio {
	ds_list_add(buttons, "Check height.")
	ds_list_add(buttons, "Check speed.")
	ds_list_add(buttons, "Release from balloon.")
	audio_play_sound(snd_InteractHard, 1, false)
}

if global.Interacting == obj_Note {
	ds_list_add(buttons, "Read.")
	ds_list_add(buttons, "Release from balloon.")
	audio_play_sound(snd_InteractSoft, 1, false)
}

if global.Interacting == obj_Package {
	ds_list_add(buttons, "Open.")
	ds_list_add(buttons, "Release from balloon.")
	audio_play_sound(snd_InteractSoft, 1, false)
}

if global.Interacting == obj_Parachute {
	ds_list_add(buttons, "Leave your family behind.")
	ds_list_add(buttons, "Release from balloon.")
	audio_play_sound(snd_InteractSoft, 1, false)
}

if global.Interacting == obj_Anvil {
	ds_list_add(buttons, "Release from balloon.")
	audio_play_sound(snd_InteractHard, 1, false)
}

var buttonY = 10

for (var i = 0; i < ds_list_size(buttons); i++) {
	var title = ds_list_find_value(buttons, i)
	var button = instance_create_depth(8, buttonY, -20, obj_Button)
	button.type = title
	buttonY += 20
}