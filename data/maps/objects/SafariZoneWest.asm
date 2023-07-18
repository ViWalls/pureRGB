	object_const_def
	const SAFARIZONEWEST_RANGER1
	const SAFARIZONEWEST_RANGER2
	const SAFARIZONEWEST_BURGLAR
	const SAFARIZONEWEST_POKEMANIAC
	const SAFARIZONEWEST_ROCKER
	const SAFARIZONEWEST_JUGGLER
	const SAFARIZONEWEST_PSYCHIC
	const SAFARIZONEWEST_ITEM1
	const SAFARIZONEWEST_ITEM2
	const SAFARIZONEWEST_ITEM3
	const SAFARIZONEWEST_ITEM4

SafariZoneWest_Object:
	db $0 ; border block

	def_warp_events
	warp_event 20,  0, SAFARI_ZONE_NORTH, 1
	warp_event 21,  0, SAFARI_ZONE_NORTH, 2
	warp_event 26,  0, SAFARI_ZONE_NORTH, 3
	warp_event 27,  0, SAFARI_ZONE_NORTH, 4
	warp_event 29, 22, SAFARI_ZONE_CENTER, 3
	warp_event 29, 23, SAFARI_ZONE_CENTER, 4
	warp_event  3,  3, SAFARI_ZONE_SECRET_HOUSE, 1
	warp_event 11, 11, SAFARI_ZONE_WEST_REST_HOUSE, 1

	def_bg_events
	bg_event 12, 12, TEXT_SAFARIZONEWEST_REST_HOUSE_SIGN
	bg_event 17,  3, TEXT_SAFARIZONEWEST_FIND_WARDENS_TEETH_SIGN
	bg_event 26,  4, TEXT_SAFARIZONEWEST_TRAINER_TIPS
	bg_event 24, 22, TEXT_SAFARIZONEWEST_SIGN

	def_object_events
	object_event 15, 24, SPRITE_BALDING_GUY, STAY, NONE, TEXT_SAFARIZONEWEST_RANGER1, OPP_RANGER, 2
	object_event 12, 7, SPRITE_COOK, STAY, NONE, TEXT_SAFARIZONEWEST_RANGER2, OPP_RANGER, 3
	object_event 21, 10, SPRITE_SUPER_NERD, STAY, NONE, TEXT_SAFARIZONEWEST_BURGLAR, OPP_BURGLAR, 1
	object_event 22, 20, SPRITE_SUPER_NERD, STAY, NONE, TEXT_SAFARIZONEWEST_POKEMANIAC, OPP_POKEMANIAC, 10
	object_event 5, 7, SPRITE_ROCKER, STAY, LEFT, TEXT_SAFARIZONEWEST_ROCKER, OPP_ROCKER, 5
	object_event 5, 6, SPRITE_ROCKER, STAY, LEFT, TEXT_SAFARIZONEWEST_JUGGLER, OPP_JUGGLER, 10
	object_event 2, 5, SPRITE_YOUNGSTER, STAY, RIGHT, TEXT_SAFARIZONEWEST_PSYCHIC, OPP_PSYCHIC_TR, 6
	object_event  8, 20, SPRITE_POKE_BALL, STAY, NONE, TEXT_SAFARIZONEWEST_ITEM1, ITEM_SAFARI_ZONE_WEST_SOUTHERN_GRASS
	object_event  9,  7, SPRITE_POKE_BALL, STAY, NONE, TEXT_SAFARIZONEWEST_ITEM2, TM_SAFARI_ZONE_WEST_NEAR_SECRET_HOUSE
	object_event 18, 18, SPRITE_POKE_BALL, STAY, NONE, TEXT_SAFARIZONEWEST_ITEM3, ITEM_SAFARI_ZONE_WEST_SOUTHEAST
	object_event 19,  7, SPRITE_POKE_BALL, STAY, NONE, TEXT_SAFARIZONEWEST_ITEM4, ITEM_SAFARI_ZONE_WEST_GOLD_TEETH

	def_warps_to SAFARI_ZONE_WEST
