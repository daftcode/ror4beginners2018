puts 'Creating customers'
customers = []
10.times do
  customers << Customer.create!(name: Faker::LordOfTheRings.character)
end

puts 'Creating categories'
categories = []
5.times do
  categories << Category.create!(name: Faker::GameOfThrones.house)
end

puts 'Creating products'
products = []
50.times do
  products << categories.sample.products.create!(name: Faker::Pokemon.name,
                                                 price: rand(1..10_000))
end

puts 'Ordering products'
products.sample(30).each do |product|
  product.update!(customer: customers.sample)
end

puts 'Done!'
