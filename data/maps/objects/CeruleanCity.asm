	object_const_def
	const CERULEANCITY_RIVAL
	const CERULEANCITY_ROCKET
	const CERULEANCITY_COOLTRAINER_M
	const CERULEANCITY_SUPER_NERD1
	const CERULEANCITY_SUPER_NERD2
	const CERULEANCITY_GUARD1
	const CERULEANCITY_COOLTRAINER_F1
	const CERULEANCITY_SLOWBRO
	const CERULEANCITY_COOLTRAINER_F2
	const CERULEANCITY_SUPER_NERD3
	const CERULEANCITY_GUARD2
	const CERULEANCITY_ITEM1

CeruleanCity_Object:
	db $f ; border block

	def_warp_events
	warp_event 27, 11, CERULEAN_TRASHED_HOUSE, 1
	warp_event 13, 15, CERULEAN_TRADE_HOUSE, 1
	warp_event 19, 17, CERULEAN_POKECENTER, 1
	warp_event 30, 19, CERULEAN_GYM, 1
	warp_event 13, 25, BIKE_SHOP, 1
	warp_event 25, 25, CERULEAN_MART, 1
	warp_event  4, 11, CERULEAN_CAVE_1F, 1
	warp_event 27,  9, CERULEAN_TRASHED_HOUSE, 3
	warp_event  9, 11, CERULEAN_BADGE_HOUSE, 2
	warp_event  9,  9, CERULEAN_BADGE_HOUSE, 1
	warp_event  15, 11, CERULEAN_OLD_ROD_HOUSE, 3
	warp_event  15,  9, CERULEAN_OLD_ROD_HOUSE, 1
	warp_event  37, 11, CERULEAN_ROCKET_HOUSE_1F, 1

	def_bg_events
	bg_event 23, 19, TEXT_CERULEANCITY_SIGN
	bg_event 17, 29, TEXT_CERULEANCITY_TRAINER_TIPS
	bg_event 26, 25, TEXT_CERULEANCITY_MART_SIGN
	bg_event 20, 17, TEXT_CERULEANCITY_POKECENTER_SIGN
	bg_event 11, 25, TEXT_CERULEANCITY_BIKESHOP_SIGN
	bg_event 27, 21, TEXT_CERULEANCITY_GYM_SIGN

	def_object_events
	object_event 20,  2, SPRITE_BLUE, STAY, DOWN, TEXT_CERULEANCITY_RIVAL 
	object_event 30,  8, SPRITE_ROCKET, STAY, NONE, TEXT_CERULEANCITY_ROCKET, OPP_ROCKET, 5
	object_event 31, 20, SPRITE_COOLTRAINER_M, STAY, DOWN, TEXT_CERULEANCITY_COOLTRAINER_M 
	object_event 15, 18, SPRITE_SUPER_NERD, WALK, UP_DOWN, TEXT_CERULEANCITY_SUPER_NERD1 
	object_event  9, 21, SPRITE_SUPER_NERD, WALK, LEFT_RIGHT, TEXT_CERULEANCITY_SUPER_NERD2 
	object_event 28, 12, SPRITE_GUARD, STAY, DOWN, TEXT_CERULEANCITY_GUARD1 
	object_event 29, 26, SPRITE_COOLTRAINER_F, STAY, LEFT, TEXT_CERULEANCITY_COOLTRAINER_F1 
	object_event 28, 26, SPRITE_MONSTER2_STILL, STAY, DOWN, TEXT_CERULEANCITY_SLOWBRO 
	object_event  9, 27, SPRITE_COOLTRAINER_F, WALK, LEFT_RIGHT, TEXT_CERULEANCITY_COOLTRAINER_F2 
	object_event  4, 12, SPRITE_SUPER_NERD, STAY, DOWN, TEXT_CERULEANCITY_SUPER_NERD3
	object_event 27, 12, SPRITE_GUARD, STAY, DOWN, TEXT_CERULEANCITY_GUARD2
	object_event 6, 31, SPRITE_POKE_BALL, STAY, NONE, TEXT_CERULEANCITY_ITEM1, ITEM_CERULEAN_CITY_SOUTHWEST_NEW

	def_warps_to CERULEAN_CITY

