# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PHOTOS = ['https://images.unsplash.com/photo-1522444195799-478538b28823?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80', 'https://images.unsplash.com/photo-1518108621213-2be030acb267?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1500&q=80', 'https://images.unsplash.com/photo-1575295446478-48e0175b05d2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1778&q=80', 'https://images.unsplash.com/photo-1601963892601-6a2110a813a0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=716&q=80', 'https://images.unsplash.com/photo-1565190462842-d57a3e05de48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=728&q=80', 'https://images.unsplash.com/photo-1599427294074-524c52911d53?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80', 'https://images.unsplash.com/photo-1595886578982-a9de564a984e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=716&q=80']

puts 'Cleaning database'
Local.destroy_all
User.create!(
  email: "teste01@teste.com",
  username: "Host1",
  password: 'abc123',
  photo: PHOTOS.sample
)
puts 'Creating Locals...'

Local.create!(
  user: User.first,
  name: "Dog Resort",
  city: "Av. Professor Mário Werneck - Belo Horizonte - MG",
  description: "Um hotel para o seu cão se sentir bem. 2.000 m² de área especialmente preparados para recebê-lo.",
  price: "60"

)

Local.create!(
  user: User.first,
  name: "Sunshine Hotel para Cães",
  city: "Avenida Otacílio Negrão de Lima - Belo Horizonte - MG",
  description: "O hotel para você possa deixar o seu cãozinho em segurança e conforto.",
  price: "70"
  
)

Local.create!(
  user: User.first,
  name: "Casa do Ronalt",
  city: "Rua Pium-í - Belo Horizonte - MG",
  description: "Um espaço amplo e confortável para o seu pet.",
  price: "40"
 
)

Local.create!(
  user: User.first,
  name: "Espaço Pet Feliz",
  city: "Avenida Oviedo Teixeira - Aracaju - SE",
  description: "Tudo que o seu pet precisa enquanto você está fora!! Já hospedamos diversos pets.",
  price: "40"
  
)

Local.create!(
  user: User.first,
  name: "Paws' care",
  city: "Rua Paim - São Paulo - SP",
  description: "Um hotel para você deixar o seu gatinho!",
  price: "65"
 
)

Local.create!(
  user: User.first,
  name: "Cantinho Felino",
  city: "Rua Paim - São Paulo - SP",
  description: "Um hotel para você deixar o seu gatinho!",
  price: "65"
 
)

Local.create!(
  user: User.first,
  name: "Gustavo",
  city: "Rua Francisco Cunha - São Paulo - SP",
  description: "Posso cuidar do seu cãozinho enquanto você não estiver viajando!",
  price: "45"
 
)

Local.create!(
  user: User.first,
  name: "Claudia's Pets",
  city: "Rua da Saudade - São Paulo - SP",
  description: "Um ótimo daycare e hotel para o seu amiguinho, com um espaço enorme para diversão!",
  price: "70"
 
)

Local.create!(
  user: User.first,
  name: "Igor - Daycare ",
  city: "Rua Paim - Rio de Janeiro - RJ",
  description: "Posso passear com o seu pet!",
  price: "50"
  
)

puts 'Done!'
