# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.destroy_all
  Tour.destroy_all
  Booking.destroy_all
  puts "DB clean"

  funny_user = User.new(
    first_name: Faker::FunnyName.name,
    email: Faker::Internet.email,
    password: "123456"
  )
  funny_user.save!
  puts "User Created"

20.times do
  tours = Tour.new(
    title: Faker::Address.city,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    limit_of_people: (1..20).to_a.sample,
    price: (50..200).to_a.sample,
    starting_time: Faker::Time.forward(days: 23, period: :morning),
    duration: (1..4).to_a.sample,
    status: true,
    destination: Faker::Address.city,
  )
  tours.user = funny_user
  tours.save!
  puts "Created tour"
end
