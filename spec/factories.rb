FactoryGirl.define do
  factory :access_code do
    
  end
  
  sequence :name do |n|
    "name#{n}"
  end

  sequence :email do |n|
    "email#{n}@example.com"
  end

  sequence :title do |n|
    "title#{n}"
  end

  sequence :phone do |n|
    "044 123 45#{n}"
  end

  sequence :category_name do |n|
    "category#{n}"
  end

  sequence :country_name do |n|
    "country#{n}"
  end

  factory :category do
    category_name 
  end

  factory :country do
    country_name 
  end

  factory :item do
    name
    email
    title
    phone
    association :category, factory: :category
    association :country, factory: :country
    price 32.79
  end

end