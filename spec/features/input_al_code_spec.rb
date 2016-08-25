require 'rails_helper'


feature 'al visitor' do
  background do 
    category = create_category
    country = create_country
    @code = create_code("yw2jk7","gjyud9")
    @item = create_item
  end
  
  scenario 'client can not look code' do
    visit al_platform_path(@item)     
    
    expect(page).not_to have_content(@item.phone)
  end

  scenario 'invalid code and show error messages' do
    visit al_platform_path(@item)     
    
    enter_submit("123weqw")

    expect(page).not_to have_content(@item.phone)
  end

  scenario 'valid code and show contact successfully' do
    visit al_platform_path(@item) 

    enter_submit(@code.al_code)
    
    expect(page).to have_content(@item.phone)
  end

end