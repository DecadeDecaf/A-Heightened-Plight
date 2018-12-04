x += 1

if x == 160 {
	sprite_index = spr_Bird
	instance_create_depth(x, y, -18, obj_Package)
}

if x >= 350 {
	instance_destroy()
}