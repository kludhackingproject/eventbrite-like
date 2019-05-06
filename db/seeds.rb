# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
100.times do
  User.create(
    first_name: Faker::Movies::LordOfTheRings.character,
    last_name: Faker::Movies::StarWars.planet,
    description: Faker::Lorem.paragraph(rand(1..50)),
    email: "#{Faker::Name.first_name}@yopmail.com"
  )
end

Event.destroy_all
100.times do
  Event.create(
    start_date: Faker::Date.forward(100),
    duration: rand(1..1000),
    title: Faker::Lorem.characters(10),
    description: Faker::Lorem.paragraph(rand(1..50)),
    price: rand(1..1000),
    location: Faker::Address.city,
    user_id: User.all.sample.id
  )
end

Attendance.destroy_all
50.times do
  the_user = User.all.sample.id
  the_event = Event.all.sample.id

  Attendance.create(
    user_id: the_user,
    event_id: the_event
  )
end
