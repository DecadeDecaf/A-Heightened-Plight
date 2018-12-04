if (global.Trash > 5 && global.FrameCount % 1800 == 0) || flamed {
	sprite_index = spr_TrashFire
	flamed = true
	var radius = 14 + round((global.FrameCount % 10) / 5)
	draw_circle(x, y - 32, radius, false)
	draw_sprite(spr_Extinguisher, 0, x, y - 32)
} else {
	sprite_index = spr_Trash
}

exists = global.TrashBin

if exists {
	draw_self()
}