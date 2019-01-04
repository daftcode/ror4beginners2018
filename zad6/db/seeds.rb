# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer1 = Customer.create!(name: 'Anakin Skywalker')
customer2 = Customer.create!(name: 'Darth Vader')

product1 = Product.create!(name: 'Anakin\'s Lightsaber', price: 2999.99, customer: customer1)
product2 = Product.create!(name: 'Podracer', price: 6000.00, customer: customer1)
product3 = Product.create!(name: 'Cloth Armor', price: 300.00, customer: customer1)
product4 = Product.create!(name: 'Dark Helmet', price: 1399.99, customer: customer2)
product5 = Product.create!(name: 'Dark Cape', price: 799.99, customer: customer2)
product6 = Product.create!(name: 'Dark Lightsaber', price: 2499.99, customer: customer2)

category1 = Category.create!(name: 'Lightsabers')
category2 = Category.create!(name: 'Armor')
category3 = Category.create!(name: 'Unique Items')
category4 = Category.create!(name: 'Vehicles')
category5 = Category.create!(name: 'Dark Stuff')

product1.categories << category1
product1.categories << category3
product2.categories << category4
product3.categories << category2
product4.categories << category2
product4.categories << category5
product5.categories << category2
product5.categories << category5
product6.categories << category1
product6.categories << category5
