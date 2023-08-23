# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

Plante.destroy_all
User.destroy_all

user = User.new(
  first_name: "a",
  last_name: "b",
  email: "a@email.com",
  password: "123456"
)

5.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Color.hex_color
  )
  user.save!
  5.times do
    plante = Plante.new(
      name: Faker::Cannabis.brand,
      price: rand(100),
      variety: Faker::Cannabis.cannabinoid,
    )
    file = URI.open("https://fleuristeladiva.ca/boutique/image/cache/catalog/Plantes%20/Fleuriste_la_diva_plante_schefflera_plante_int%C3%A9rieure_Laval-550x550.jpg")
    plante.image.attach(io: file, filename: "plante", content_type: "image/png")
    plante.user = user
    plante.save!
  end
end

puts "#{User.count} users and #{Plante.count} plants created"
