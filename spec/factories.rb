FactoryGirl.define do
  factory :country do
    
  end
  
  sequence :firstname do |n|
    "firstname#{n}"
  end

  sequence :lastname do |n|
    "lastname#{n}"
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

  sequence :name do |n|
    "category#{n}"
  end

  factory :category do
    name 
  end

  factory :item do
    firstname
    lastname
    email
    title
    phone
    association :category
    price 32.79
  end

end