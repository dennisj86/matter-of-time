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
Faker::UniqueGenerator.clear

16.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.free_email,
    wallet: Faker::Number.number(digits: 4),
    description: Faker::Quotes::Shakespeare.unique.hamlet_quote,
    birth_date: Faker::Date.between(from: '1940-09-23', to: '2014-09-25')
  )
  puts "#{user.first_name} #{user.last_name} ;;;; #{user.description} ;;;; #{user.birth_date}"
end

admin = User.create(
  email: "admin@admin.com",
  first_name: "Admin",
  last_name: "Istrator",
  password: '123456',
  wallet: 100,
  birth_date: Faker::Date.between(from: '1940-09-23', to: '2014-09-25'),
  description: Faker::Quote.yoda
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

andrew = User.create(
  email: "andrew@meyer.com",
  first_name: "Andrew",
  last_name: "Meyer",
  password: '123456'
)
puts "Created #{andrew.email}"

kathrine = User.create(
  email: "kathrine@smith.com",
  first_name: "Kathrine",
  last_name: "Smith",
  password: '123456'
)
puts "Created #{kathrine.email}"

anne = User.create(
  email: "anne@brown.com",
  first_name: "Anne",
  last_name: "Brown",
  password: '123456'
)
puts "Created #{anne.email}"

mary = User.create(
  email: "mary@poppins.com",
  first_name: "Mary",
  last_name: "Poppins",
  password: '123456'
)
puts "Created #{mary.email}"

rory = User.create(
  email: "rory@campbell.com",
  first_name: "Rory",
  last_name: "Campbell",
  password: '123456'
)
puts "Created #{rory.email}"

mathew = User.create(
  email: "mathew@Hanna.com",
  first_name: "Mathew",
  last_name: "Hanna",
  password: '123456'
)
puts "Created #{mathew.email}"

graham = User.create(
  email: "graham@Stanton.com",
  first_name: "Graham",
  last_name: "Stanton",
  password: '123456'
)
puts "Created #{graham.email}"

mohamed = User.create(
  email: "mohamed@lewis.com",
  first_name: "Mohamed",
  last_name: "Levis",
  password: '123456'
)
puts "Created #{mohamed.email}"

rashad = User.create(
  email: "rashad@Crosby.com",
  first_name: "Rashad",
  last_name: "Crosby",
  password: '123456'
)
puts "Created #{rashad.email}"

gianni = User.create(
  email: "gianni@ford.com",
  first_name: "Gianni",
  last_name: "Ford",
  password: '123456'
)
puts "Created #{gianni.email}"

jessie = User.create(
  email: "jessie@bray.com",
  first_name: "Jessie",
  last_name: "Bray",
  password: '123456'
)
puts "Created #{jessie.email}"

mohamed = User.create(
  email: "mohamed@lewis.com",
  first_name: "Mohamed",
  last_name: "Levis",
  password: '123456'
)
puts "Created #{mohamed.email}"

mohamed = User.create(
  email: "mohamed@lewis.com",
  first_name: "Mohamed",
  last_name: "Levis",
  password: '123456'
)
puts "Created #{mohamed.email}"



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
message_1_reply = Message.create!(
  content: "hi!, nice to here from you!",
  user_id: booking_1.market.user.id,
  booking_id: booking_1.id
)
puts "message #{message_1.id} by #{message_1.user.first_name} created"
puts "message #{message_1_reply.id} by #{message_1_reply.user.first_name} created"

5.times do
  message = Message.create!(
    content: Faker::Quote.unique.yoda,
    user_id: booking_1.user.id,
    booking_id: booking_1.id
  )
  message_reply = Message.create!(
    content: Faker::Quotes::Shakespeare.unique.king_richard_iii_quote,
    user_id: booking_1.market.user.id,
    booking_id: booking_1.id
  )
  puts "message #{message.id} by #{message.user.first_name} created. content: #{message.content}"
  puts "message #{message_reply.id} by #{message_reply.user.first_name} created. content: #{message_reply.content}"
end


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
