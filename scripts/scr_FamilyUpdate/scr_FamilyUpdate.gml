if global.FrameCount % appetite == 0 && !saved && !hurt {
	if starving || parched {
		if object_index == obj_Mother {
			global.Mother = false
		} else if object_index == obj_Brother {
			global.Brother = false
		} else if object_index == obj_Sister {
			global.Sister = false
		}
	} else if hungry {
		starving = true
	} else if thirsty {
		parched = true
	} else {
		if choose(true, false) {
			hungry = true
		} else {
			thirsty = true
		}
	}
}