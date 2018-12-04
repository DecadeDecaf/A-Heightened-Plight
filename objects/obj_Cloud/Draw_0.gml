draw_self()

var linespeed = round(global.Speed * 1.5)

for (var i = 0; i < ds_list_size(xLines); i++) {
	var lineX = ds_list_find_value(xLines, i)
	var lineY = ds_list_find_value(yLines, i)
	draw_line(lineX, lineY, lineX, lineY - 100)
	if lineY - linespeed < 0 {
		ds_list_replace(yLines, i, lineY + 280)
		ds_list_replace(xLines, i, irandom_range(0, 320))
	} else {
		ds_list_replace(yLines, i, lineY - linespeed)
	}
}