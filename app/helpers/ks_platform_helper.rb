module KsPlatformHelper
	
	def check_code(input_code, item)
		product = item
		real_code = AccessCode.first.ks_code
		if real_code == input_code
			desplay_valid_contact(product)
		else
			desplay_invalid_contact	
		end
	end

	def desplay_valid_contact(product)
		"<h3 class='text-center'> Numri kontaktues </h3><h5 class='text-center' style='color: blue'>#{product.phone}</h5>".html_safe
	end

	def desplay_invalid_contact
		"<h3 class='text-center' style='color:red'> Kodi nuk eshte i sakt </h3>".html_safe
	end

	def regenerate_ks_code

	end

end
