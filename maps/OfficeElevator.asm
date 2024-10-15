OfficeElevator_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  1,  3, OFFICE, -1
	warp_event  2,  3, OFFICE, -1

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, OfficeElevatorButton

	def_object_events

OfficeElevatorButton:
	opentext
	elevator .Floors
	closetext
	iffalse DoNothingScript
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
	end

.Floors:
	db 2 ; floors
	elevfloor FLOOR_19F, 1, OFFICE
	elevfloor FLOOR_B1F, 1, ROCKET_HIDEOUT_B1F
	db -1 ; end
