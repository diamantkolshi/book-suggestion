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

item1 = Item.new(category_id: category1.id, country_id: country1.id, name: "Produkt 1", location: "Prishtine", title: "Libra te ndryshem",
 			description: "Matematika 10, Gejografi,", price: 23.5, address: "Rr. Rame Bllaca", phone: "044123321", code: nil, pending: nil, approve: true)
puts "created item 1"

item2 = Item.new(category_id: category2.id, country_id: country2.id, name: "Produkt 2", location: "Tirane", title: "Libra te ndryshem ne sh",
 			description: "Matematika 10, Gejografi,", price: 23.5, address: "Rr. Rame Bllaca", phone: "044223321", code: nil, pending: nil, approve: true)
puts "created item 2"

item1.save
item2.save

puts "...completed"
