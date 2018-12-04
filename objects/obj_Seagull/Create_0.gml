targeted = false
target = -1

repeat 1000 {
	var item = irandom_range(1, 7)
	if item == 1 && global.Telephone {
		targeted = true
		target = obj_Telephone
		break
	} else if item == 2 && global.Radio {
		targeted = true
		target = obj_Radio
		break
	} else if item == 3 && global.Medkit {
		targeted = true
		target = obj_Medkit
		break
	} else if item == 4 && global.Extinguisher {
		targeted = true
		target = obj_Extinguisher
		break
	} else if item == 5 && global.Food > 0 {
		targeted = true
		target = obj_Food
		break
	} else if item == 6 && global.Water > 0 {
		targeted = true
		target = obj_Water
		break
	} else if item == 7 && global.Gum > 0 {
		targeted = true
		target = obj_Gum
		break
	}
}

if !targeted {
	instance_destroy()
}