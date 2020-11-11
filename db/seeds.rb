# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.create(name: 'Pedro Paramo', origin: 'colombia', price: 5000)
Product.create(name: 'Juan Valdez', origin: 'sudafrica', price: 3500)
Product.create(name: 'Don Estarbak', origin: 'venezuela', price: 2000)

product_prices = Product.pluck :id, :price

1000.times do
  product_prices_random = product_prices.shuffle.first

  Sale.create(
    date: Faker::Date.between(from: '2017-01-01', to: Date.today),
    product_id: product_prices_random[0],
    amount: product_prices_random[1]
  )
end