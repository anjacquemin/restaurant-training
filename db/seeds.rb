# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
# For cloudinary
require "open-uri"

puts "Destroying previous data..."

Review.destroy_all
# Rental.destroy_all
# Restaurant.destroy_all
User.destroy_all

puts "Data destroyed, start seeding ..."


antho = User.new({
  first_name: "Antho",
  last_name: "jacquemin",
  email: "antho@gmail.com",
  restaurant_owner: true,
  password: "PASSWORD",
  password_confirmation: "PASSWORD"
})

file = URI.open("https://avatars.githubusercontent.com/u/7106777?v=4")
antho.photo.attach(io: file, filename: "#{antho.last_name}-1")
antho.save!

raph = User.new({
  first_name: "Raph",
  last_name: "Grelon",
  email: "raph@gmail.com",
  restaurant_owner: false,
  password: "PASSWORD",
  password_confirmation: "PASSWORD"
})

raph.save!

10.times do
  user = User.new({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    restaurant_owner: false,
    password: "PASSWORD",
    password_confirmation: "PASSWORD"
  })
  user.save!
end

street_numbers = (1..20).to_a

10.times do
  restaurant = Restaurant.new({
    name: Faker::Restaurant.name,
    description: Faker::Lorem.sentence(word_count: 8),
    address: "#{street_numbers.last} rue oberkampf, Paris ",
    category: Faker::Restaurant.type,
    rating: rand(0..5),
    user: User.first
  })
  street_numbers.pop
  restaurant.save!
end



10.times do
  rental = Rental.new({
    date: DateTime.new(2022, rand(3..5), rand(1..28), rand(12..15), [0, 30].sample),
    restaurant: Restaurant.all.sample,
    number_of_people: rand(0..5),
    user: User.first
  })
  rental.save!
end

10.times do
  rental = Rental.new({
    date: DateTime.new(2022, rand(3..5), rand(1..28), rand(12..15), [0, 30].sample),
    restaurant: Restaurant.all.sample,
    number_of_people: rand(0..5),
    user: User.where(first_name: "Raph")[0]
  })
  rental.save!
end


20.times do
  review = Review.new({
    description: Faker::Lorem.sentence(word_count: 8),
    rating: rand(0..5),
    rental: Rental.all.sample
  })
  review.save!
end


####################"LOOGING THE RESULTS FOR TESTING"#############
puts "#############BEGGINING OF TESTS FOLLOWING SEED IMPLEMENTATION############"
p ""
p ""

p "-----------TEST IF SEED HAS BEEN ADDED----------"

puts "------------------User------------------"
users = User.all
p users
puts "-------------------------------------------"
puts ""

puts "------------------Restaurant------------------"
restaurants = Restaurant.all
p restaurants
puts "-------------------------------------------"
puts ""


puts "------------------rental------------------"
rentals = Rental.all
p rentals
puts "-------------------------------------------"
puts ""

puts "------------------review------------------"
reviews = Review.all
p reviews
puts "-------------------------------------------"
puts ""


p "-----------TEST OF Active record associations----------"
p "Restaurant : "
restaurants.each { |restaurant|
  p "Reviews : "
  p restaurant.reviews
}


p "-----------TEST OF Active records ----------"
# to be completed

puts "#########END OF TEST#########"
