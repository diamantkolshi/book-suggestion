# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
Country.delete_all

category1 = Category.create(name: "Libra te kl 10")
category2 = Category.create(name: "Libra te kl 11")
Category.create(name: "Libra te kl 12")
Category.create(name: "Libra te kl 13")
Category.create(name: "Libra fakultetit")
Category.create(name: "Libra te ndryshem")

country1 = Country.create(name: "Kosova")
country2 = Country.create(name: "Shqiperia")

AccessCode.create(al_code: rand(36**6).to_s(36), ks_code: rand(36**6).to_s(36), registration_code: rand(36**6).to_s(36))

item1 = Item.create(category_id: category1.id, country_id: country1.id, name: "Produkt 1", location: "Prishtinë", title: "Libra te ndryshem",
 			description: "Matematika 10, Gejografi,", price: 23.5, address: "Rr. Rame Bllaca", phone: "044123321", code: nil, pending: nil, approve: true, status: "sale")
puts "created item 1"
Item.create(category_id: category1.id, country_id: country1.id, name: "Produkt 2", location: "Prishtinë", title: "Libra te ndryshem 11",
 			description: "Matematika 10, Gejografi 10,", address: "Rr. Rame Bllaca 2", phone: "044123111", code: nil, pending: nil, approve: true, status: "give")
puts "created item 2"

item2 = Item.create(category_id: category2.id, country_id: country2.id, name: "Produkt 3", location: "Tirana", title: "Libra te ndryshem ne sh",
 			description: "Matematika 10 1, Gejografi 11 2,", price: 23.5, address: "Rr. Sali Berisha", phone: "+2534325235", code: nil, pending: nil, approve: true, status: "sale")
puts "created item 3"  
Item.create(category_id: category2.id, country_id: country2.id, name: "Produkt 4", location: "Tirana", title: "Libra te ndryshem ne shit",
 			description: "Matematika 10 as, Gejografi 11,", address: "Rr. Sali Brenisha 2", phone: "+35234262363", code: nil, pending: nil, approve: true, status: "give")
puts "created item 4"

puts "...completed"
