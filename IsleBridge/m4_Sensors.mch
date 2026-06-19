machine m4_Sensors refines m3_TrafficLights
sees cColor cCapacity
variables
	entering
	islecars
	exiting
	cars
	ml_tl
	il_tl
	ml_out_10
	il_out_10
	ml_in_10
	il_in_10
invariants
	@ml_out_10_ty ml_out_10 ∈ BOOL
	@ml_out_10_ok ml_out_10=TRUE⇒ml_tl=green
	@il_out_10_ty il_out_10 ∈ BOOL
	@il_out_10_ok il_out_10=TRUE⇒il_tl=green
	@ml_in_10_ty ml_in_10 ∈ BOOL
	@il_in_10_ty il_in_10 ∈ BOOL
events
	event INITIALISATION extends INITIALISATION
	then
		@ml_out_10 ml_out_10 ≔ FALSE
		@il_out_10 il_out_10 ≔ FALSE
		@ml_in_10 ml_in_10 ≔ FALSE
		@il_in_10 il_in_10 ≔ FALSE
	end
	event ML2BR refines ML2BR
	when
		@ml_out_10_ok ml_out_10 = TRUE
		@IL2BR_il_tl_ok il_out_10=TRUE⇒il_tl=green
	then
		@ml_out_10_ko ml_out_10 ≔ FALSE
		@ml_tl_ko ml_tl ≔   red
		@entering entering ≔   entering+1
	end
	event BR2ML refines BR2ML
	when
		@ml_in_10_ok ml_in_10 = TRUE
		@ML2BR_ml_tl_ok ml_out_10=TRUE⇒{TRUE ↦ red,FALSE ↦ ml_tl}(bool(ml_tl=green∧¬(exiting − 1=0∧¬cars − 1=capacity)))=green
		@IL2BR_il_tl_ok il_out_10=TRUE⇒{TRUE ↦ red,FALSE ↦ il_tl}(bool(il_tl=green∧¬entering=0))=green
	then
		@ml_in_10_ko ml_in_10 ≔ FALSE
		@ml_tl_ko ml_tl ≔  {TRUE ↦ red,FALSE ↦ ml_tl}(bool(ml_tl=green∧¬(exiting − 1=0∧¬cars − 1=capacity)))
		@il_tl_ko il_tl ≔  {TRUE ↦ red,FALSE ↦ il_tl}(bool(il_tl=green∧¬entering=0))
	end
	event BR2IL refines BR2IL
	when
		@il_in_10_ok il_in_10 = TRUE
		@ML2BR_ml_tl_ok ml_out_10=TRUE⇒{TRUE ↦ red,FALSE ↦ ml_tl}(bool(ml_tl=green∧¬(exiting=0∧¬cars=capacity)))=green
		@IL2BR_il_tl_ok il_out_10=TRUE⇒{TRUE ↦ red,FALSE ↦ il_tl}(bool(il_tl=green∧¬entering − 1=0))=green
	then
		@il_in_10_ko il_in_10 ≔ FALSE
		@ml_tl_ko ml_tl ≔  {TRUE ↦ red,FALSE ↦ ml_tl}(bool(ml_tl=green∧¬(exiting=0∧¬cars=capacity)))
		@il_tl_ko il_tl ≔  {TRUE ↦ red,FALSE ↦ il_tl}(bool(il_tl=green∧¬entering − 1=0))
	end
	event IL2BR refines IL2BR
	when
		@stay_ctr   islecars − 1≥0
		@il_out_10_ok il_out_10 = TRUE
		@ML2BR_ml_tl_ok ml_out_10=TRUE⇒ml_tl=green
	then
		@il_out_10_ko il_out_10 ≔ FALSE
		@il_tl_ko il_tl ≔   red
		@exiting exiting ≔   exiting+1
		@islecars islecars ≔   islecars−1
	end
	event ml_green extends ml_green
	then
		@il_out_10_ko il_out_10 ≔ FALSE
	end
	event il_green extends il_green
	then
		@ml_out_10_ko ml_out_10 ≔ FALSE
	end
	event ML2BR_sensor
	when
		@ml_out_10_ko ml_out_10 = FALSE
		@ml_tl_ok  ml_tl =  green
	then
		@ml_out_10 ml_out_10 ≔ TRUE
	end
	event IL2BR_sensor
	when
		@il_out_10_ko il_out_10 = FALSE
		@il_tl_ok  il_tl =  green
	then
		@il_out_10 il_out_10 ≔ TRUE
	end
	event BR2ML_sensor
	when
		@ml_in_10_ko ml_in_10 = FALSE
	then
		@ml_in_10 ml_in_10 ≔ TRUE
	end
	event BR2IL_sensor
	when
		@il_in_10_ko il_in_10 = FALSE
	then
		@il_in_10 il_in_10 ≔ TRUE
	end
end
