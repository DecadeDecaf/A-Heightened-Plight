var weight = 0

//Resources

repeat global.Trash {
	weight += 20
}

repeat global.Food + global.Water + global.Gum {
	weight += 20
}

//Family

if global.Father {
	weight += 100
}

if global.Mother && !obj_Mother.saved {
	weight += 100
}

if global.Brother && !obj_Brother.saved {
	weight += 80
}

if global.Sister && !obj_Sister.saved {
	weight += 80
}

if global.Dog {
	weight += 60
}

//Items

if global.TrashBin {
	weight += 50
}

if global.Medkit {
	weight += 40
}

if global.Extinguisher {
	weight += 60
}

if global.Parachute {
	weight += 40
}

if global.Telephone {
	weight += 50
}

if global.Radio {
	weight += 50
}

repeat global.Note {
	weight += 20
}

repeat global.Anvil {
	weight += 100
}

repeat instance_number(obj_Package) {
	weight += 40
}


return weight