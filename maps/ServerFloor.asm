ServerFloor_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, PorygonServerCallback

	def_warp_events
	warp_event 10,  0, OFFICE_ELEVATOR, 1
    
	def_coord_events

	def_bg_events
	bg_event 13, 12, BGEVENT_READ, ScreenVirus

	def_object_events
	object_event 10,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MadScientistScript, EVENT_MAD_SCIENTIST
	object_event  1, 16, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerScientistGepetto, -1
	object_event 11, 13, SPRITE_PORYGON, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PorygonScript, EVENT_GOT_PORYGON

	object_const_def
	const OFFICE_MAD_SCIENTIST
	const OFFICE_SCIENTIST_1
	const PORYGON_OW

PorygonServerCallback:
	disappear PORYGON_OW
	disappear OFFICE_MAD_SCIENTIST
	endcallback

MadScientistScript:
	end

GenericTrainerScientistGepetto:
	generictrainer SCIENTIST, GEPETTO, EVENT_BEAT_SCIENTIST_GEPETTO, ScientistGepettoSeenText, ScientistGepettoBeatenText

	text "People say that"
	line "I ask too many"
	cont "questions, but"

	para "that's what guys"
	line "do, right?"
	done

ScreenVirus:
	checkevent EVENT_VIRUS
	iftruefwd .VirusAlreadyActivated
	showtext ScreenVirusText
	changeblock 14, 12, $24
	pause 5
	refreshmap
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	appear PORYGON_OW
	setevent EVENT_VIRUS
	pause 20
	special Special_FadeInQuickly
	end

.VirusAlreadyActivated:
	showtext ScreenVirusText
	end

PorygonScript:
	faceplayer
	showemote EMOTE_SHOCK, PORYGON_OW, 15
	pause 20

	checkevent EVENT_GOT_PORYGON
	iftruefwd .AlreadyGotGiftPoke
	readvar VAR_PARTYCOUNT
	ifequalfwd PARTY_LENGTH, .PartyFullGift

	reanchormap
	pokepic PORYGON
	cry PORYGON
	waitbutton
	closepokepic

	opentext
	writetext PorygonText
	promptbutton

	disappear PORYGON_OW
	givepoke PORYGON, PLAIN_FORM, 20, ORAN_BERRY
	setevent EVENT_GOT_PORYGON

	closetext

	appear OFFICE_MAD_SCIENTIST
	setevent EVENT_MAD_SCIENTIST
	applymovement OFFICE_MAD_SCIENTIST, MadScientistMovement
	showemote EMOTE_SHOCK, OFFICE_MAD_SCIENTIST, 15

	end

.PartyFullGift:
	opentext
	writetext PartyFullGiftText
	waitbutton
	closetext
	end

.AlreadyGotGiftPoke:
	opentext
	writetext AlreadyGotGiftText
	waitbutton
	closetext
	end

MadScientistMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	turn_head_right
	step_end

ScreenVirusText:
	text "Something bad is"
	line "happening..."
	cont "KERNEL PANIC!"

	para "01100111 01101111"
	line "01010101 01110010"

	done

PartyFullGiftText:
	text "Party is full."
	done
	
PorygonText:
	text "Someone left this"
	line "#MON for you."
	
	para "There is a label"
	line "on the #MON:"
	cont "<PLAYER>"
	done

AlreadyGotGiftText:
	text "Take good care of"
	line "that gift #MON"
	done

ScientistGepettoSeenText:
	text "Hi! What's your"
	line "name? Where are"
	cont "you going?"
	done

ScientistGepettoBeatenText:
	text "I was just"
	line "asking…"
	done
	