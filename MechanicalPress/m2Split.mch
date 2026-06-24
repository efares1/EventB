machine m2Split refines m1Door
variables
	start_motor_button_pressed_done
	door_opening
	motor_starting
	door
	motor
	clutch
	start_motor_button
	not_yet_engaged
invariants
	@start_motor_button_pressed_done_ty start_motor_button_pressed_done ∈ BOOL
	@door_opening_ty door_opening ∈ BOOL
	@motor_starting_ty motor_starting ∈ BOOL
events
	event INITIALISATION extends INITIALISATION
	then
		@start_motor_button_pressed_done_init start_motor_button_pressed_done ≔ FALSE
		@door_opening_init door_opening ≔ FALSE
		@motor_starting_init motor_starting ≔ FALSE
	end
	event close_door extends close_door end
	event stop_motor extends stop_motor end
	event engage_clutch extends engage_clutch end
	event disengage_clutch extends disengage_clutch end
	event start_motor_button_depressed extends start_motor_button_depressed end
	event start_motor_button_pressed_action extends start_motor_button_pressed end
	event open_door_action
	when
		@door_opening_noact door_opening = FALSE
		@door_set  door = TRUE
		@STRONG  clutch = FALSE
		@SF1b FALSE=door∧FALSE=motor
	then
		@door_opening_act door_opening ≔ TRUE
	end
	event start_motor_button_pressed_reaction
	when
		@start_motor_button_pressed_done TRUE=start_motor_button
		@start_motor_button_pressed_done_noreact start_motor_button_pressed_done = FALSE
	then
		@start_motor_button_pressed_done_react start_motor_button_pressed_done ≔ TRUE
		@when_SM motor_starting ≔ bool( motor = FALSE ∨ motor_starting = TRUE)
	end
	event open_door_reaction
	when
		@open_door_done FALSE=door∧FALSE=clutch
		@door_opening_noreact door_opening = FALSE
	then
		@door_opening_react door_opening ≔ TRUE
	end
	event start_motor_reaction
	when
		@start_motor_done TRUE=motor
		@motor_starting_noreact motor_starting = FALSE
	then
		@motor_starting_react motor_starting ≔ TRUE
	end
end
