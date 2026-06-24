machine m1Door refines m0Root
variables
	door
	motor
	clutch
	start_motor_button
	not_yet_engaged
invariants
	@door_ty door ∈ BOOL
	@motor_ty motor ∈ BOOL
	@clutch_ty clutch ∈ BOOL
	@start_motor_button_ty start_motor_button ∈ BOOL
	@not_yet_engaged_ty not_yet_engaged ∈ BOOL
	@STRONG clutch = TRUE ⇒ door = TRUE
	@safe3  door=TRUE ⇒ motor=TRUE
events
	event INITIALISATION extends INITIALISATION
	then
		@not_yet_engaged not_yet_engaged ≔ FALSE
		@door door ≔ FALSE
		@motor motor ≔ FALSE
		@clutch clutch ≔ FALSE
		@start_motor_button start_motor_button ≔ FALSE
	end
	event open_door
	when
		@door_set door = TRUE
		@STRONG clutch = FALSE
	then
		@door door ≔ FALSE
	end
	event close_door
	when 
		@safe3 motor=TRUE
		@door_reset door = FALSE
	then
		@not_yet_engaged not_yet_engaged ≔ TRUE
		@door door ≔ TRUE
	end
	event start_motor
	when
		@motor_reset motor = FALSE
	then
		@motor motor ≔ TRUE
	end
	event stop_motor
	when 
		@safe3 door=FALSE
		@motor_set motor = TRUE
	then
		@motor motor ≔ FALSE
	end
	event engage_clutch
	when
		@clutch_reset clutch = FALSE
		@STRONG door = TRUE
		@STRONG_once not_yet_engaged = TRUE
	then
		@not_yet_engaged not_yet_engaged ≔ FALSE
		@clutch clutch ≔ TRUE
	end
	event disengage_clutch
	when
		@clutch_set clutch = TRUE
	then
		@clutch clutch ≔ FALSE
	end
	event start_motor_button_pressed
	when
		@start_motor_button_reset start_motor_button = FALSE
	then
		@start_motor_button start_motor_button ≔ TRUE
	end
	event start_motor_button_depressed
	when
		@start_motor_button_set start_motor_button = TRUE
	then
		@start_motor_button start_motor_button ≔ FALSE
	end
end
