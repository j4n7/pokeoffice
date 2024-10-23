Office_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, TapeStateCallback

	def_warp_events
	warp_event 10,  0, OFFICE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event  1, 13, BGEVENT_READ, Tape

	def_object_events
	object_event  3,  4, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficeEmployee1Script, -1
	object_event  3,  9, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficeEmployee2Script, -1
	object_event 16, 14, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficeEmployee3Script, -1

	object_const_def
	const OFFICE_EMPLOYEE_1
	const OFFICE_EMPLOYEE_2
	const OFFICE_EMPLOYEE_3

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

StartTapeText:
	text "<PLAYER>"
	line "started tape."
	done

StopTapeText:
	text "<PLAYER>"
	line "stopped tape."
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
