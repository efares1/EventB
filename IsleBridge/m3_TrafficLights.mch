machine m3_TrafficLights refines m2_BridgeToIsle
sees cColor cCapacity
variables
	entering
	islecars
	exiting
	cars
	ml_tl
	il_tl
invariants
	@ml_tl_ty ml_tl ∈ COLOR
	@ml_tl_ok ml_tl=green⇒exiting=0∧¬cars=capacity
	@il_tl_ty il_tl ∈ COLOR
	@il_tl_ok il_tl=green⇒entering=0
	@il_tl_ml_tl_excl il_tl =  red ∨ ml_tl =  red
events
	event INITIALISATION extends INITIALISATION
	then
		@ml_tl ml_tl ≔  red
		@il_tl il_tl ≔  red
	end
	event ML2BR refines ML2BR
	when
		@ml_tl_ok ml_tl =  green
	then
		@ml_tl_ko ml_tl ≔  red
		@entering entering ≔  entering+1
	end
	event BR2ML extends BR2ML
	then
		@ml_tl_ko ml_tl ≔ {TRUE ↦ red,FALSE ↦ ml_tl}(bool(ml_tl=green∧¬(exiting − 1=0∧¬cars − 1=capacity)))
		@il_tl_ko il_tl ≔ {TRUE ↦ red,FALSE ↦ il_tl}(bool(il_tl=green∧¬entering=0))
	end
	event BR2IL extends BR2IL
	then
		@ml_tl_ko ml_tl ≔ {TRUE ↦ red,FALSE ↦ ml_tl}(bool(ml_tl=green∧¬(exiting=0∧¬cars=capacity)))
		@il_tl_ko il_tl ≔ {TRUE ↦ red,FALSE ↦ il_tl}(bool(il_tl=green∧¬entering − 1=0))
	end
	event IL2BR refines IL2BR
	when
		@stay_ctr  islecars − 1≥0
		@il_tl_ok il_tl =  green
	then
		@il_tl_ko il_tl ≔  red
		@exiting exiting ≔  exiting+1
		@islecars islecars ≔  islecars−1
	end
	event ml_green
	when
		@ml_tl_ko ml_tl =  red
		@exclusivity  exiting=0
		@capacity  ¬cars=capacity
	then
		@ml_tl ml_tl ≔  green
		@il_tl il_tl ≔  red
	end
	event il_green
	when
		@il_tl_ko il_tl =  red
		@exclusivity  entering=0
	then
		@il_tl il_tl ≔  green
		@ml_tl ml_tl ≔  red
	end
end
