# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
Country.delete_all

Category.create(name: "Libra te kl 10")
Category.create(name: "Libra te kl 11")
Category.create(name: "Libra te kl 12")
Category.create(name: "Libra te kl 13")
Category.create(name: "Libra fakultetit")
Category.create(name: "Libra te ndryshem")

Country.create(name: "Kosova")
Country.create(name: "Shqiperia")

puts "...completed"
