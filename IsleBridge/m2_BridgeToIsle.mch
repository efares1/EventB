machine m2_BridgeToIsle refines m1_IsleCapacity
variables
	entering
	islecars
	exiting
	cars
invariants
	@entering_ty entering ∈ ℤ
	@islecars_ty islecars ∈ ℤ
	@exiting_ty exiting ∈ ℤ
	@exclusivity  entering = 0 ∨ exiting = 0
	@enter_ctr  entering ≥ 0
	@stay_ctr  islecars ≥ 0
	@exit_ctr  exiting ≥ 0
	@glueing  cars = entering + islecars + exiting
events
	event INITIALISATION extends INITIALISATION
	then
		@entering entering ≔ 0
		@islecars islecars ≔ 0
		@exiting exiting ≔ 0
	end
	event ML2BR extends ML2BR
	when 
		@exclusivity exiting=0
	then
		@entering entering ≔ entering+1
	end
	event BR2ML extends BR2ML
	when 
		@exclusivity entering=0∨exiting − 1=0
		@exit_ctr exiting − 1≥0
	then
		@exiting exiting ≔ exiting−1
	end
	event BR2IL
	when 
		@exclusivity entering − 1=0∨exiting=0
		@enter_ctr entering − 1≥0
	then
		@islecars islecars ≔ islecars+1
		@entering entering ≔ entering−1
	end
	event IL2BR
	when 
		@exclusivity entering=0
		@stay_ctr islecars − 1≥0
	then
		@exiting exiting ≔ exiting+1
		@islecars islecars ≔ islecars−1
	end
end
