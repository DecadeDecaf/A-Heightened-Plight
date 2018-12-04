targeted = false
target = -1

repeat 1000 {
	var member = irandom_range(1, 3)
	if member == 1 && global.Mother {
		targeted = true
		target = obj_Mother
		break
	} else if member == 2 && global.Brother {
		targeted = true
		target = obj_Brother
		break
	} else if member == 3 && global.Sister {
		targeted = true
		target = obj_Sister
		break
	}
}

if !targeted {
	instance_destroy()
}