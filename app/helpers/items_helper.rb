module ItemsHelper
	def check_code(input_code)
		code_form = input_code
		real_code = AccessCode.first.registration_code
		if real_code == input_code
			true
		else
			false	
		end
	end

	def regeneration_code
		real_code = AccessCode.first
		real_code.registration_code = rand(36**6).to_s(36)
		real_code.save
	end
end
