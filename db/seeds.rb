require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_user = User.create(email: "test@test.com", password: "123456")

test_trip = Trip.create(name: "A night in Philly", description: "a nutritional gauntlet", location: "Philly", start_time: Time.now, end_time: Time.now + 8.hours, duration: 4, cost: 40, user_id: test_user.id)


user = User.create(
  email: "fake@fake.com",
  password: '123456',
  )
  3.times do
    user.events << Event.create(
      name: Faker::Coffee.blend_name + " " + user.email,
      description: Faker::Coffee.notes,
      location: Faker::Space.planet,
      start_time: Time.now + 1.hours,
      end_time: Time.now + 3.hours,
      duration: 3,
      cost: 5,
      user_id: user.id
    )
  end
  3.times do
      user.trips << Trip.create(
        name: Faker::Coffee.blend_name + " " + user.email,
        description: Faker::RickAndMorty.quote,
        location: "Philly",
        start_time: Time.now,
        end_time: Time.now + 9.hours,
        duration: 4,
        cost: 40,
        user_id: user.id
      )
    end
    3.times do
      user.trips.last.events << Event.create(
        name: Faker::Coffee.blend_name + " " + user.email,
        description: Faker::Coffee.notes,
        location: Faker::Space.planet,
        start_time: Time.now + 1.hours,
        end_time: Time.now + 3.hours,
        duration: 3,
        cost: 5,
        user_id: user.id
      )
    end
