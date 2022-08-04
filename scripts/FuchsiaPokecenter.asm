FuchsiaPokecenter_Script:
	call SetLastBlackoutMap ; PureRGBnote: ADDED: set blackout map on entering pokemon center
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

FuchsiaPokecenter_TextPointers:
	dw FuchsiaHealNurseText
	dw FuchsiaPokecenterText2
	dw FuchsiaPokecenterText3
	dw FuchsiaTradeNurseText

FuchsiaHealNurseText:
	script_pokecenter_nurse

FuchsiaPokecenterText2:
	text_far _FuchsiaPokecenterText1
	text_end

FuchsiaPokecenterText3:
	text_far _FuchsiaPokecenterText3
	text_end

FuchsiaTradeNurseText:
	script_cable_club_receptionist
