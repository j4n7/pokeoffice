Office_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  4, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficeEmployee1Script, -1
	object_event  3,  9, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficeEmployee2Script, -1
	object_event 16, 14, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficeEmployee3Script, -1
	object_event  5, 15, SPRITE_BALL_CUT_FRUIT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_SCRIPT, 0, PorygonBallScript, -1

	object_const_def
	const OFFICE_EMPLOYEE_1
	const OFFICE_EMPLOYEE_2
	const OFFICE_EMPLOYEE_3
	const PORYGON_BALL

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

PorygonBallScript:
	faceplayer
	readvar VAR_PARTYCOUNT
	ifequalfwd PARTY_LENGTH, .PartyFullGift
	disappear PORYGON_BALL
	opentext
	writetext PorygonBallText
	promptbutton
	givepoke PORYGON, PLAIN_FORM, 20, ORAN_BERRY
	closetext
	end

.PartyFullGift:
	opentext
	writetext PartyFullGiftText
	waitbutton
	closetext
	end
	
PartyFullGiftText:
	text "Party is full."

	done
	
PorygonBallText:
	text "Someone left this"
	line "#MON for you."
	
	para "There is a label"
	line "on the Ball:"
	cont "<PLAYER>"

	done
	
ReceivedGiftText:
	text "<PLAYER> received"
	line "@"

	text_ram wStringBuffer3
	text "!"

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