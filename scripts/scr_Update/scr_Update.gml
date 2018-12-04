global.FrameCount += 1
global.TelephoneCooldown -= 1
global.TrashCooldown -= 1

global.Weight = scr_CalculateWeight()
global.Speed = global.Weight / 100
global.Height -= global.Weight / 1000

if global.FrameCount % 3600 == 0 {
	instance_create_depth(-30, 30, -18, choose(obj_Seagull, obj_Woodpecker))
}

if global.Height <= 0 && room == rm_Game {
	global.Score = 1
	if global.Mother {
		global.Score += 1
	}
	if global.Brother {
		global.Score += 1
	}
	if global.Sister {
		global.Score += 1
	}
	if global.Dog {
		global.Score += 1
	}
	global.Score *= 20
	room_goto(rm_End)
}