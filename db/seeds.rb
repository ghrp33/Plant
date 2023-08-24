# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

Request.destroy_all
Plante.destroy_all
User.destroy_all

first_user = User.new(
  first_name: "a",
  last_name: "b",
  email: "a@email.com",
  password: "123456"
)
first_user.save!

first_plante = Plante.new(
  name: Faker::Cannabis.brand,
  price: rand(100),
  variety: Faker::Cannabis.cannabinoid
)
file = URI.open("https://img.freepik.com/photos-gratuite/plante-lys-paix-dans-objet-decoration-pot-terre-cuite_53876-146302.jpg?w=2000")
first_plante.image.attach(io: file, filename: "first_plante", content_type: "image/png")
first_plante.user = first_user
first_plante.save!

second_user = User.new(
  second_name: "c",
  last_name: "d",
  email: "c@email.com",
  password: "123456"
)
second_user.save!

second_plante = Plante.new(
  name: Faker::Cannabis.brand,
  price: rand(100),
  variety: Faker::Cannabis.cannabinoid
)
file = URI.open("https://www.schilliger.com/media/filer_public_thumbnails/filer_public/b9/51/b951865d-d491-421b-bf3f-8b52b58872c4/monstera-2.jpg__1170x0_q85_subsampling-2_upscale.jpg")
second_plante.image.attach(io: file, filename: "second_plante", content_type: "image/png")
second_plante.user = second_user
second_plante.save!

5.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Color.hex_color
  )
  user.save!
  3.times do
    plante = Plante.new(
      name: Faker::Cannabis.brand,
      price: rand(100),
      variety: Faker::Cannabis.cannabinoid
    )
    file = URI.open("https://fleuristeladiva.ca/boutique/image/cache/catalog/Plantes%20/Fleuriste_la_diva_plante_schefflera_plante_int%C3%A9rieure_Laval-550x550.jpg")
    plante.image.attach(io: file, filename: "plante", content_type: "image/png")
    plante.user = user
    plante.save!

    request = Request.new(
      user: user,
      plante: plante
    )
    request.save!
  end
end

puts "#{User.count} users and #{Plante.count} plants created"
