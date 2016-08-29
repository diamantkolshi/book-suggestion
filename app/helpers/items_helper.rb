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

end
