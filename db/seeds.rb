# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

Plante.destroy_all
User.destroy_all
5.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Color.hex_color
  )
  user.save!
  rand(0...5).times do
    plante = Plante.new(
      name: Faker::Cannabis.brand,
      price: rand(100),
      variety: Faker::Cannabis.cannabinoid
    )
    plante.user = user
    plante.save!
  end
end
