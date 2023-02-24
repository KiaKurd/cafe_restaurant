# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


(1..20).each do |id| 
  User.create!(nd(1..20)
    name: Faker::Name.name,
    email: Faker::Internet.email,
    age: Faker::Date.birthday(min_age: 18, max_age: 70),
    address: Faker::Address.street,
    tel: Faker::PhoneNumber.phone_number
  )
end

(1..20).each do |id|
  CafeRestaurantT.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    website: Faker::Internet.url,
    description: Faker::Restaurant.description
  )
end

(1..20).each do |id|
  UserRole.create!(
    user_id: rand(1..20),
    cafe_restaurant_t_id: rand(1..20),
    active: %i(false active).sample,
    role_type: %W(admin chef waiter).sample
  )
end