xLines = ds_list_create()
yLines = ds_list_create()

repeat 32 {
	var lineX = irandom_range(0, 320)
	var lineY = irandom_range(0, 280)
	ds_list_add(xLines, lineX)
	ds_list_add(yLines, lineY)
}