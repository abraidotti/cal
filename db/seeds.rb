require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_user = User.create(email: "test@test.com", fname: "Testy", lname: "Testaverde", password: "123456")

test_user.events << Event.create(
  name: Faker::Food.metric_measurement + " " + user.email,
  description: Faker::Coffee.notes,
  location: "824 Morris St, Philadelphia, PA",
  start_time: Time.now + 1.hours,
  end_time: Time.now + 3.hours,
  duration: 3,
  cost: 5,
  user_id: user.id
)

test_user << Trip.create(name: "A night in Philly", description: "a nutritional gauntlet", location: "Philly", start_time: Time.now, end_time: Time.now + 8.hours, duration: 4, cost: 40, user_id: test_user.id)

test_user.trips.last.events << Event.create(
  name: Faker::Coffee.blend_name + " " + user.email,
  description: Faker::Hipster.sentence(3, true),
  location: "1502 South Broad St, Philadelphia, PA",
  start_time: Time.now + 1.hours,
  end_time: Time.now + 3.hours,
  duration: 3,
  cost: 5,
  user_id: user.id
)

user = User.create(
  email: "fake@fake.com",
  fname: Faker::Ancient.primordial,
  lname: Faker::Food.spice,
  password: '123456',
  )
  3.times do
    user.events << Event.create(
      name: Faker::Coffee.blend_name + " " + user.email,
      description: Faker::Coffee.notes,
      location: "2314 East Harold St, Philadelphia, PA",
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
        location: "145 Emily St, Philadelphia, PA",
        start_time: Time.now,
        end_time: Time.now + 9.hours,
        duration: 4,
        cost: 40,
        user_id: user.id
      )
    end
    3.times do
      user.trips.last.events << Event.create(
        name: Faker::Space.planet + " " + user.email,
        description: Faker::Coffee.notes,
        location: "1600 East Cherry St, Philadelphia, PA",
        start_time: Time.now + 1.hours,
        end_time: Time.now + 3.hours,
        duration: 3,
        cost: 5,
        user_id: user.id
      )
    end
