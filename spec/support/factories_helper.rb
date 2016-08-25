def create_country
	FactoryGirl.create(:country)
end

def create_category
	FactoryGirl.create(:category)
end

def create_code(al_code, ks_code)
	FactoryGirl.create(:access_code, al_code: al_code, ks_code: ks_code)
end

def create_item
	FactoryGirl.create(:item)
end