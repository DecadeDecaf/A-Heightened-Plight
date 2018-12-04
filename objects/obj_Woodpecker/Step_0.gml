if !target.exists || target.saved {
	targeted = false
}

if targeted {
	var itemX = target.x
	var itemY = target.y
	var clickDirection = point_direction(x, y, itemX, itemY)
	x += round(lengthdir_x(2, clickDirection))
	y += round(lengthdir_y(2, clickDirection))
	if point_distance(x, y, itemX, itemY) < 16 {
		target.hurt = true
		target.hungry = false
		target.thirsty = false
		target.starving = false
		target.parched = false
		target.alarm[0] = target.toughness
		targeted = false
	}
} else {
	x += 1
	y -= 2
}

if y < -30 {
	instance_destroy()
}