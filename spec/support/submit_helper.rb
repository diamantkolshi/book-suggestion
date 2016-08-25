def enter_submit(code)
	find_field('code')
  fill_in 'code', with: code
  click_on "submit"
end