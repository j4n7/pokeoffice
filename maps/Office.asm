Office_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, TapeStateCallback

	def_warp_events
	warp_event  9,  0, OFFICE_ELEVATOR, 1
	warp_event 10,  0, OFFICE_ELEVATOR, 2

	def_coord_events

	def_bg_events
	bg_event  1, 13, BGEVENT_READ, Tape

	def_object_events
	object_event  3,  4, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficeEmployee1Script, -1
	object_event  3,  9, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficeEmployee2Script, -1
	object_event 16, 14, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficeEmployee3Script, -1
	object_event 18,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerScientistGepetto, -1
	object_event  7, 14, SPRITE_PORYGON, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PorygonScript, EVENT_GOT_PORYGON

	object_const_def
	const OFFICE_EMPLOYEE_1
	const OFFICE_EMPLOYEE_2
	const OFFICE_EMPLOYEE_3
	const OFFICE_SCIENTIST_1
	const PORYGON_OW

OfficeEmployee1Script:
	faceplayer
	opentext
	writetext OfficeEmployee1Text
	promptbutton
	turnobject OFFICE_EMPLOYEE_1, UP
	endtext

OfficeEmployee2Script:
	faceplayer
	opentext
	writetext OfficeEmployee2Text
	promptbutton
	turnobject OFFICE_EMPLOYEE_2, UP
	endtext

OfficeEmployee3Script:
	faceplayer
	opentext
	writetext OfficeEmployee3Text
	promptbutton
	turnobject OFFICE_EMPLOYEE_3, UP
	endtext

GenericTrainerScientistGepetto:
	generictrainer SCIENTIST, GEPETTO, EVENT_BEAT_SCIENTIST_GEPETTO, ScientistGepettoSeenText, ScientistGepettoBeatenText

	text "People say that"
	line "I ask too many"
	cont "questions, but"

	para "that's what guys"
	line "do, right?"
	done

Tape:
	checkevent EVENT_ANIM_TAPE
	iftruefwd .StopTape
	showtext StartTapeText
	setevent EVENT_ANIM_TAPE
	changeblock 0, 12, $35
	pause 5
	refreshmap
	end

.StopTape:
	showtext StopTapeText
	clearevent EVENT_ANIM_TAPE
	changeblock 0, 12, $4A
	pause 5
	refreshmap
	end

TapeStateCallback:
	checkevent EVENT_ANIM_TAPE
	iffalsefwd .ChangeTapeBlock
	endcallback

.ChangeTapeBlock:
	changeblock 0, 12, $4A
	endcallback

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

	endtext

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

StartTapeText:
	text "<PLAYER>"
	line "started tape."
	done

StopTapeText:
	text "<PLAYER>"
	line "stopped tape."
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

OfficeEmployee1Text:
	text "Work, work, work."
	line "No sleep."
	done

OfficeEmployee2Text:
	text "I'm busy,"
	line "don't bother me."
	done

OfficeEmployee3Text:
	text "I'm from Naljo."
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
