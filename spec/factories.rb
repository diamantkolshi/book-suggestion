FactoryGirl.define do
  factory :access_code do
    ks_code "gjyud9"
    al_code "yw2jk7"
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

  sequence :description do |n|
    "Gjuhe Shqipe 1#{n}, Matematike 1#{n}"
  end 

  factory :category do
    name "klasa e 10"
  end

  factory :country do
    name "kosova"
  end

  factory :item do
    name
    email
    title
    description
    phone
    location "Prishtina"
    association :category, factory: :category
    association :country, factory: :country
    price 32.79
    approve true
  end

end