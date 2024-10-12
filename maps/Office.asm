Office_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  4, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficeEmployee1Script, -1
	object_event  3,  9, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficeEmployee2Script, -1

	object_const_def
	const OFFICE_EMPLOYEE_1
	const OFFICE_EMPLOYEE_2

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
	
OfficeEmployee1Text:
	text "Work, work, work."
	line "No sleep."

	done

OfficeEmployee2Text:
	text "I'm busy,"
	line "don't bother me."

	done
