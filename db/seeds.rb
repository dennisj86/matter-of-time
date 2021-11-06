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
admin = {
  email: "admin@admin.com",
  password: '123456'
}

john = {
  email: "john@smith.com",
  password: '123456'
}

james = {
  email: "james@bond.com",
  password: '123456'
}

steven = {
  email: "steven@seagull.com",
  password: '123456'
}

johannes = {
  email: "johannes@berger.com",
  password: '123456'
}

thomas = {
  email: "thomas@mueller.com",
  password: '123456'
}

[admin, john, james, steven, johannes, thomas].each { |user|
  user = User.create!(user)
  puts "Created #{user.email}"
}
#admins = User.create!(admin)
#puts "Created #{admins.email}"


puts "Creating offers..."

offer_1 = {
  category: 'Education',
  title: "Learn Javascript",
  description: 'I have over 4 years experience as a fullstack developer and have created a compact course to teach Javascript in under 10 hours. Book your first 60 minutes to learn the basics.',
  offer_request: 0,
  user_id: admin.id
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
