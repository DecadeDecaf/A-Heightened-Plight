depth = -19

var moving = false
var moveY = 0
var moveX = 0

//Keyboard Movement

if keyboard_check(ord("W")) || keyboard_check(vk_up) {
	moveY -= 2
	clicked = false
}

if keyboard_check(ord("S")) || keyboard_check(vk_down) {
	moveY += 2
	clicked = false
}

if keyboard_check(ord("A")) || keyboard_check(vk_left) {
	moveX -= 2
	clicked = false
}

if keyboard_check(ord("D")) || keyboard_check(vk_right) {
	moveX += 2
	clicked = false
}

//Mouse Movement

if mouse_check_button_pressed(mb_left) && mouse_y >= 80 {
	clickedX = round(mouse_x)
	clickedY = round(mouse_y)
	clicked = true
}

if clicked {
	var clickDirection = point_direction(x, y, clickedX, clickedY)
	moveX = round(lengthdir_x(2, clickDirection))
	moveY = round(lengthdir_y(2, clickDirection))
	if point_distance(x, y, clickedX, clickedY) < 24 {
		clicked = false
		}
	}

//Handle Movement

if abs(moveX) + abs(moveY) > 0 {
	moving = true	
	x += moveX
	if x > 280 || x < 40 {
		x -= moveX
		clicked = false
	}
	y += moveY
	if y < 100 || y > 160 {
		y -= moveY
		clicked = false
	}
}

//Animation

if moving {
	if sprite_index == spr_Father {
		sprite_index = spr_FatherWalk
		image_index = 0
	}
} else {
	sprite_index = spr_Father
}

//Sprite Flip

if moveX > 0 {
	image_xscale = 1
} else if moveX < 0 {
	image_xscale = -1	
}