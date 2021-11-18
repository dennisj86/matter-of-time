# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Market.destroy_all
User.destroy_all

admin = User.create(
  email: "admin@admin.com",
  first_name: "Admin",
  last_name: "Istrator",
  password: '123456'
)
puts "Created #{admin.email}"

john = User.create(
  email: "john@smith.com",
  first_name: "John",
  last_name: "Smith",
  password: '123456'
)
puts "Created #{john.email}"

james = User.create(
  email: "james@bond.com",
  first_name: "James",
  last_name: "Bond",
  password: '123456'
)
puts "Created #{james.email}"

steven = User.create(
  email: "steven@seagull.com",
  first_name: "Steven",
  last_name: "Seagull",
  password: '123456'
)
puts "Created #{steven.email}"

johannes = User.create(
  email: "johannes@berger.com",
  first_name: "Johannes",
  last_name: "Berger",
  password: '123456'
)
puts "Created #{johannes.email}"

thomas = User.create(
  email: "thomas@mueller.com",
  first_name: "Thomas",
  last_name: "Mueller",
  password: '123456'
)
puts "Created #{thomas.email}"


puts "Creating offers..."

offer_1 = {
  category: 'Education',
  title: "Learn Javascript",
  description: 'I have over 4 years experience as a fullstack developer and have created a compact course to teach Javascript in under 10 hours. Book your first 60 minutes to learn the basics.',
  offer_request: 0,
  user_id: thomas.id
}

offer_2 = {
  category: 'Animals',
  title: "No time to walk your dog?",
  description: 'I am a veterinary student and offer to walk your dog between 1 pm and 6 pm. Just shoot me a text if I can help you out.',
  offer_request: 0,
  user_id: steven.id
}

offer_3 = {
  category: 'Sports',
  title: "Get fit after new year",
  description: 'I am a fitness freak looking for people that want to get fit after christmas season.',
  offer_request: 0,
  user_id: james.id
}



[offer_1, offer_2, offer_3].each { |offer|
  market = Market.create!(offer)
  puts "Created #{market.title}"
}

puts "Creating requests..."

request_1 = {
  category: 'Music',
  title: "Looking for Beginner Piano Lessons",
  description: 'I have a 5 year old daughter that wants to learn the piano.',
  offer_request: 1,
  user_id: john.id
}

request_2 = {
  category: 'Handywork',
  title: "Our flat is a mess",
  description: 'We are 4 mamaboi-students sharing a flat and need help keeping our cave tidy.',
  offer_request: 1,
  user_id: johannes.id
}

request_3 = {
  category: 'Education',
  title: "Looking for help with homeschooling",
  description: 'My 14 year-old son needs help with homeschooling in math and physics during lockdown',
  offer_request: 1,
  user_id: steven.id
}

[request_1, request_2, request_3].each { |request|
  market = Market.create!(request)
  puts "Created #{market.title}"
}

booking_1 = Booking.create!(
  user_id: john.id,
  market_id: Market.last.id
)
puts "booking #{booking_1.id} created"

booking_2 = Booking.create!(
  user_id: thomas.id,
  market_id: Market.last.id
)
puts "booking #{booking_2.id} created"

booking_3 = Booking.create!(
  user_id: steven.id,
  market_id: Market.first.id
)
puts "booking #{booking_3.id} created"

message_1 = Message.create!(
  content: "hi!, My name is John and I would like to do what the market does",
  user_id: booking_1.user.id,
  booking_id: booking_1.id
)
puts "message #{message_1.id} by #{message_1.user.first_name} created"

message_2 = Message.create!(
  content: "hi! My name is Thomas and I dont know what I'm doing here. HELP!",
  user_id: booking_2.user.id,
  booking_id: booking_2.id
)

puts "message #{message_2.id} by #{message_2.user.first_name} created"

message_3 = Message.create!(
  content: "Howdy. Do you rent horses?",
  user_id: booking_3.user.id,
  booking_id: booking_3.id
)
puts "message #{message_3.id} by #{message_3.user.first_name} created"

message_4 = Message.create!(
  content: "Bojack?",
  user_id: Market.first.user.id,
  booking_id: booking_3.id
)

puts "message #{message_4.id} by #{message_4.user.first_name} created"
