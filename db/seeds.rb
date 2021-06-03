# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database'
Local.destroy_all
User.create!(
  email: "teste01@teste.com",
  password: 'abc123'
)
puts 'Creating Locals...'

Local.create!(
  user: User.first,
  name: "Random house",
  city: "larchmont",
  description: "kshkjhdjdkhks",
  price: "15"
)

Local.create!(
  user: User.first,
  name: "Random house 1",
  city: "mamaroneck",
  description: "kshkjhdjdkhks",
  price: "20"
)

puts 'Done!'
