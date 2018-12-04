if hurt {
	var radius = 14 + round((global.FrameCount % 10) / 5)
	draw_circle(x, y - 32, radius, false)
	draw_sprite(spr_Medkit, 0, x, y - 32)
}

if hungry {
	var radius = 14
	if starving {
		radius += round((global.FrameCount % 10) / 5)
	}
	draw_circle(x, y - 32, radius, false)
	draw_sprite(spr_Food, 6, x, y - 32)
}

if thirsty {
	var radius = 14
	if parched {
		radius += round((global.FrameCount % 10) / 5)
	}
	draw_circle(x, y - 32, radius, false)
	draw_sprite(spr_Water, 6, x, y - 32)
}