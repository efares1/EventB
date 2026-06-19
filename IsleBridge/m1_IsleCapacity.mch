machine m1_IsleCapacity refines m0_IsleAccess
sees cCapacity
variables
	cars
invariants
	@cars_ty cars ∈ ℤ
	@capacity  cars ∈ 0‥capacity
events
	event INITIALISATION extends INITIALISATION
	then
		@cars cars ≔ 0
	end
	event ML2BR extends ML2BR
	when 
		@capacity ¬cars=capacity
	then
		@cars cars ≔ cars+1
	end
	event BR2ML extends BR2ML
	when 
		@capacity cars − 1∈0 ‥ capacity
	then
		@cars cars ≔ cars−1
	end
end
