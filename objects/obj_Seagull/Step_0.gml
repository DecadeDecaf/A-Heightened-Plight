if !target.exists || (target == obj_Food && global.Food == 0) || (target == obj_Water && global.Water == 0) || (target == obj_Gum && global.Gum == 0) {
	targeted = false
}

if targeted {
	var itemX = target.x
	var itemY = target.y
	var clickDirection = point_direction(x, y, itemX, itemY)
	x += round(lengthdir_x(2, clickDirection))
	y += round(lengthdir_y(2, clickDirection))
	if point_distance(x, y, itemX, itemY) < 16 {
		if target == obj_Medkit {
			global.Medkit = false
		} else if target == obj_Telephone {
			global.Telephone = false
		} else if target == obj_Radio {
			global.Radio = false
		} else if target == obj_Extinguisher {
			global.Extinguisher = false
		} else if target == obj_Food {
			global.Food -= 1
		} else if target == obj_Water {
			global.Water -= 1
		} else if target == obj_Gum {
			global.Gum -= 1
		}
		targeted = false
	}
} else {
	x += 1
	y -= 2
}

if y < -30 {
	instance_destroy()
}