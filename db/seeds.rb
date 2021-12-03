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
  description: Faker::Quote.yoda,
  avatar: "m_avatar.svg"
)
puts "Created #{admin.email}"

john = User.create(
  email: "john@smith.com",
  first_name: "John",
  last_name: "Smith",
  password: '123456',
  avatar: "man_1.jpg"
)
puts "Created #{john.email}"

james = User.create(
  email: "james@bond.com",
  first_name: "James",
  last_name: "Bond",
  password: '123456',
  avatar: "man_2.jpg"
)
puts "Created #{james.email}"

steven = User.create(
  email: "steven@seagull.com",
  first_name: "Steven",
  last_name: "Seagull",
  password: '123456',
  avatar: "man_3.jpg"
)
puts "Created #{steven.email}"

johannes = User.create(
  email: "johannes@berger.com",
  first_name: "Johannes",
  last_name: "Berger",
  password: '123456',
  avatar: "man_4.jpg"
)
puts "Created #{johannes.email}"

thomas = User.create(
  email: "thomas@mueller.com",
  first_name: "Thomas",
  last_name: "Mueller",
  password: '123456',
  avatar: "man_5.jpg"
)
puts "Created #{thomas.email}"

andrew = User.create(
  email: "andrew@meyer.com",
  first_name: "Andrew",
  last_name: "Meyer",
  password: '123456',
  avatar: "man_6.jpg"
)
puts "Created #{andrew.email}"

kathrine = User.create(
  email: "kathrine@smith.com",
  first_name: "Kathrine",
  last_name: "Smith",
  password: '123456',
  avatar: "woman_1.jpg"
)
puts "Created #{kathrine.email}"

anne = User.create(
  email: "anne@brown.com",
  first_name: "Anne",
  last_name: "Brown",
  password: '123456',
  avatar: "woman_2.jpg"
)
puts "Created #{anne.email}"

mary = User.create(
  email: "mary@poppins.com",
  first_name: "Mary",
  last_name: "Poppins",
  password: '123456',
  avatar: "woman_3.jpg"
)
puts "Created #{mary.email}"

rory = User.create(
  email: "rory@campbell.com",
  first_name: "Rory",
  last_name: "Campbell",
  password: '123456',
  avatar: "woman_4.jpg"
)
puts "Created #{rory.email}"

mathew = User.create(
  email: "mathew@hanna.com",
  first_name: "Mathew",
  last_name: "Hanna",
  password: '123456',
  avatar: "m_avatar.svg"
)
puts "Created #{mathew.email}"

graham = User.create(
  email: "graham@Stanton.com",
  first_name: "Graham",
  last_name: "Stanton",
  password: '123456',
  avatar: "m_avatar.svg"
)
puts "Created #{graham.email}"

mohamed = User.create(
  email: "mohamed@lewis.com",
  first_name: "Mohamed",
  last_name: "Levis",
  password: '123456',
  avatar: "m_avatar.svg"
)
puts "Created #{mohamed.email}"

rashad = User.create(
  email: "rashad@Crosby.com",
  first_name: "Rashad",
  last_name: "Crosby",
  password: '123456',
  avatar: "m_avatar.svg"
)
puts "Created #{rashad.email}"

gianni = User.create(
  email: "gianni@ford.com",
  first_name: "Gianni",
  last_name: "Ford",
  password: '123456',
  avatar: "m_avatar.svg"
)
puts "Created #{gianni.email}"

jessie = User.create(
  email: "jessie@bray.com",
  first_name: "Jessie",
  last_name: "Bray",
  password: '123456',
  avatar: "woman_5.jpg"
)
puts "Created #{jessie.email}"

jordyn = User.create(
  email: "jordyn@freeman.com",
  first_name: "Jordyn",
  last_name: "Freeman",
  password: '123456',
  avatar: "woman_6.jpg"
)
puts "Created #{jordyn.email}"

yareli = User.create(
  email: "yareli@whitaker.com",
  first_name: "Yareli",
  last_name: "Whitaker",
  password: '123456',
  avatar: "m_avatar.svg"
)
puts "Created #{yareli.email}"



puts "Creating offers..."

offer_1 = {
  category: 'Education',
  title: "Learn Javascript",
  description: 'I have over 4 years experience as a fullstack developer and have created a compact course to teach Javascript in under 10 hours. Book your first 60 minutes to learn the basics.',
  offer_request: 0,
  user_id: thomas.id,
  remote: 0,
  image: "java.jpg",
  time: 60,
  location: "Hamburg",
}

offer_2 = {
  category: 'Animals',
  title: "No time to walk your dog?",
  description: 'I am a veterinary student and offer to walk your dog between 1 pm and 6 pm. Just shoot me a text if I can help you out.',
  offer_request: 0,
  user_id: steven.id,
  remote: 1,
  image: "walking-dog.jpg",
  time: 45,
  location: "",
}

offer_3 = {
  category: 'Sports',
  title: "Get fit after new year",
  description: 'I am a fitness freak looking for people that want to get fit after christmas season.',
  offer_request: 0,
  user_id: james.id,
  remote: 1,
  image: "fitness.jpg",
  time: 90,
  location: "Munich",
}

offer_4 = {
  category: 'Plants',
  title: "Garden tips and tricks",
  description: 'Are you a beginner gardener and wonder how and where to start? I got your back! With 10 years of expericence with my own garden I have pretty much made all the mistakes you can make and figured out how to avoid them. Wether you want to start your own veggie garden or want to have the most beautiful roses I will answer your questions!',
  offer_request: 0,
  user_id: andrew.id,
  remote: 1,
  image: "outdoor-gardening.jpg",
  time: 45,
  location: "Hamburg",
}

offer_5 = {
  category: 'Crafts',
  title: "How to make the ceramics",
  description: "Ask me anything about ceramics. I have over 20 years of experience with makes my own ceramics. I can help you with your struggles that need to be mastered in the beginning.
                If you haven't started yet I can help you find the right tools and help you avoid unnecessary purchases. ",
  offer_request: 0,
  user_id: kathrine.id,
  remote: 1,
  image: "close-up-hand-holding-brush.jpg",
  time: 30,
  location: "Hamburg",
}

offer_6 = {
  category: "Education",
  title: "Want to change your life?",
  description: 'Then start to code. I have been through that journey. Was sick of my old career and was in need for a change. With basically no coding experience I started my journey to become a great programmer with a perspective and flexibility to work and enjoy my life.',
  offer_request: 0,
  user_id: anne.id,
  remote: 1,
  image: "programming.jpg",
  time: 60,
  location: "Duisburg",
}

offer_7 = {
  category: 'Education',
  title: "Math problems? No worries! ",
  description: "Especially during the pandemic it was hard for kids to keep up with the school work and working parents just don't have the time to study with their kid.
  I am a retired school teacher that wants to help families that don't have the money to pay for tutoring.",
  offer_request: 0,
  user_id: mary.id,
  remote: 1,
  image: "old-lady-teching.jpg",
  time: 30,
  location: "Hamburg",
}

offer_8 = {
  category: 'Plants',
  title: "All your plants are dying?",
  description: "Not anymore! I will help you stop killing all your plants and it's not that hard.",
  offer_request: 0,
  user_id: mathew.id,
  remote: 1,
  image: "gardening.jpg",
  time: 30,
  location: "Stade",
}

offer_9 = {
  category: 'Education',
  title: "Everything you need to know about crypto",
  description: 'Do you find the crypto market confusing or hard to understand how it works? Bit coin what? I will give you a short introduction and explain the important parts you need to know und understand. You can ask questions. ',
  offer_request: 0,
  user_id: rory.id,
  remote: 1,
  image: "bitcion.jpg",
  time: 60,
  location: "Bremen",
}

offer_10 = {
  category: 'Crafts',
  title: "Want to start sewing?",
  description: 'But not sure if you like it or got no sewing machine? You can come over to my place and start your own little project. Your can choose between several different projects. Your pay for the materials. ',
  offer_request: 0,
  user_id: graham.id,
  remote: 1,
  image: "sewing.jpg",
  time: 90,
  location: "Mainz",
}


[offer_1, offer_2, offer_3, offer_4, offer_5, offer_6, offer_7, offer_8, offer_9, offer_10].each { |offer|
  market = Market.create!(offer)
  puts "Created #{market.title}"
}

puts "Creating requests..."

request_1 = {
  category: 'Music',
  title: "Looking for Beginner Piano Lessons",
  description: 'I have a 5 year old daughter that wants to learn the piano.',
  offer_request: 1,
  user_id: john.id,
  remote: 1,
  image: "headphones.jpg",
  time: 60,
  location: "Berlin",
}

request_2 = {
  category: 'Handywork',
  title: "Our flat is a mess",
  description: 'We are 4 mamaboi-students sharing a flat and need help keeping our cave tidy.',
  offer_request: 1,
  user_id: johannes.id,
  remote: 1,
  image: "the-carpenter-works-with-a-tree.jpg",
  time: 60,
  location: "Berlin",
}

request_3 = {
  category: 'Education',
  title: "Looking for help with homeschooling",
  description: 'My 14 year-old son needs help with homeschooling in math and physics during lockdown',
  offer_request: 1,
  user_id: steven.id,
  remote: 1,
  image: "two-kids-using-laptop-during-lesson.jpg",
  time: 60,
  location: "Kiel",
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
