RedsHouse1F_Script:
	call SetLastBlackoutMap ; PureRGBnote: ADDED: set blackout map on entering pokemon center
	jp EnableAutoTextBoxDrawing

RedsHouse1F_TextPointers:
	dw RedsHouse1FMomText
	dw RedsHouse1FTVText

RedsHouse1FMomText:
	text_asm
	CheckEvent EVENT_CALLED_DAD_WAITING
	jr nz, .not_here
	ld b, 0
	CheckEvent EVENT_CALLED_MOM_RICE_BALLS
	jr nz, .foodReady
	inc b
	CheckEvent EVENT_CALLED_MOM_JELLY_DONUTS
	jr nz, .foodReady
	inc b
	CheckEvent EVENT_CALLED_MOM_BRISKET
	jr nz, .foodReady
	inc b
	CheckEvent EVENT_CALLED_MOM_LASAGNA
	jr nz, .foodReady
	ld a, [wd72e]
	bit 3, a ; received a Pokémon from Oak?
	jr nz, .heal
	ld hl, MomWakeUpText
	rst _PrintText
	rst TextScriptEnd
.heal
	call MomHealPokemon
	rst TextScriptEnd
.not_here
	ld hl, MomDadNotHereText
	rst _PrintText
	ResetEvent EVENT_CALLED_DAD_WAITING
	rst TextScriptEnd
.foodReady
	push bc
	call SaveScreenTilesToBuffer2
	; start the text
	ld hl, MomFoodReadyText
	rst _PrintText
	; load some food tiles on the table
	ld hl, vChars2 tile 5
	ld de, FoodTiles
	lb bc, BANK(FoodTiles), 1
	call CopyVideoData
	ld hl, vChars2 tile $28
	ld de, FoodTiles tile 1
	lb bc, BANK(FoodTiles), 1
	call CopyVideoData
	; reusing some tiles from the ss anne tileset
	ld hl, vChars2 tile $37
	ld de, Ship_GFX tile $50
	lb bc, BANK(Ship_GFX), 2
	call CopyVideoData
	ld a, SFX_NOISE_INSTRUMENT02
	rst _PlaySound
	ld a, SFX_59
	call PlaySoundWaitForCurrent
	ld hl, MomFoodBonAppetit
	rst _PrintText

	call GBFadeOutToWhite
	ld c, 60
	call DelayFrames
	call ClearScreen
	ld hl, TextScriptEndingText
	rst _PrintText ; seemingly the only way of preventing sprites from flickering on the screen during the next printText
	call GBPalNormal
	pop bc
	ld a, b
	and a
	ld hl, MomFoodRiceBallsText
	jr z, .printText
	dec a
	ld hl, MomFoodJellyDonutsText
	jr z, .printText
	dec a
	ld hl, MomFoodBrisketText
	jr z, .printText
	ld hl, MomFoodLasagnaText
.printText
	rst _PrintText
	; store a party pokemon's nickname to use later in the text
	ld a, [wPartyCount]
	cp 6 ; if they player has less than 6 pokemon just use the first pokemon
	ld a, 0
	jr nz, .firstPokemon
.random ; otherwise randomize it between any of the 6
	call Random
	and %111
	cp 6
	jr nc, .random
.firstPokemon
	push af
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, MomFoodPokemonJoinsText
	rst _PrintText
	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1
	pop af
	call AddNTimes
	call WaitForSoundToFinish
	ld a, [hl] ; species
	call PlayCry
	call WaitForSoundToFinish
	ld hl, MomFoodPokemonChowedDownText
	rst _PrintText
	ld a, SFX_FLY
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld hl, MomFoodPokemonShowText
	rst _PrintText
	call ClearScreen
	call MomHealPokemonImmediate
	call LoadScreenTilesFromBuffer2

	; remove food tiles on the table
	ld hl, vChars2 tile 5
	ld de, RedsHouse1_GFX tile 5
	lb bc, BANK(RedsHouse1_GFX), 1
	call CopyVideoData
	ld hl, vChars2 tile $28
	ld de, RedsHouse1_GFX tile $28
	lb bc, BANK(RedsHouse1_GFX), 1
	call CopyVideoData
	ld hl, vChars2 tile $37
	ld de, RedsHouse1_GFX tile $37
	lb bc, BANK(RedsHouse1_GFX), 2
	call CopyVideoData

	call UpdateSprites
	call GBFadeInFromWhite
	ld hl, MomFoodDone
	rst _PrintText
	ResetEventRange EVENT_CALLED_MOM_RICE_BALLS, EVENT_CALLED_MOM_LASAGNA
	rst TextScriptEnd

MomWakeUpText:
	text_far _MomWakeUpText
	text_end

MomDadNotHereText:
	text_far _MomDadNotHereText
	text_end

MomFoodReadyText:
	text_far _MomFoodReadyText
	text_end

MomFoodBonAppetit:
	text_far _MomFoodBonAppetit
	text_end

MomFoodRiceBallsText:
	text_far _MomFoodRiceBallsText
	text_end

MomFoodJellyDonutsText:
	text_far _MomFoodJellyDonutsText
	text_end

MomFoodBrisketText:
	text_far _MomFoodBrisketText
	text_end

MomFoodLasagnaText:
	text_far _MomFoodLasagnaText
	text_end

MomFoodPokemonJoinsText:
	text_far _MomFoodPokemonJoinsText
	text_end

MomFoodPokemonChowedDownText:
	text_far _MomFoodPokemonChowedDownText
	text_end

MomFoodPokemonShowText:
	text_far _MomFoodPokemonShowText
	sound_get_item_1
	text_end

MomFoodDone:
	text_far _MomFoodDone
	text_end

MomHealPokemon:
	ld hl, MomHealText1
	rst _PrintText
	call GBFadeOutToWhite
	call ReloadMapData
	call MomHealPokemonImmediate
	call GBFadeInFromWhite
	ld hl, MomHealText2
	jp PrintText

MomHealPokemonImmediate:
	predef HealParty
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	rst _PlaySound
.next
	ld a, [wChannelSoundIDs]
	cp MUSIC_PKMN_HEALED
	jr z, .next
	ld a, [wMapMusicSoundID]
	ld [wNewSoundID], a
	rst _PlaySound
	ret

MomHealText1:
	text_far _MomHealText1
	text_end
MomHealText2:
	text_far _MomHealText2
	text_end

RedsHouse1FTVText:
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ld hl, TVWrongSideText
	jr nz, .got_text
	ld hl, StandByMeText
.got_text
	rst _PrintText
	rst TextScriptEnd

StandByMeText:
	text_far _StandByMeText
	text_end

TVWrongSideText:
	text_far _TVWrongSideText
	text_end
