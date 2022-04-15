# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning user database"
Booking.destroy_all
Flat.destroy_all
User.destroy_all
puts "Cleaning user database: done"
puts 'creating users'



   user1 =User.create!(
    email: "test1@test.com",
    password: "111111",
    first_name: "pino1",
    last_name: "daniele1"
  )
  puts "name: ---#{user1.first_name}"
  
  user2 =User.create!(
    email: "test2@test.com",
    password: "111111",
    first_name: "pino2",
    last_name: "daniele2"
  )
  puts "name: ---#{user2.first_name}"
  
  user3 =User.create!(
    email: "test3@test.com",
    password: "111111",
    first_name: "pino3",
    last_name: "daniele3"
  )
  puts "name: ---#{user3.first_name}"
  



boolean = [true, false]
london_address = ['10 Downing Street','3 Pudding Lane','4 Abbey Road','221 B Baker Street','Buckingham Palace','165 Eaton Place','17 Cherry Tree Lane','186 Fleet Stree','1 gaverick mews','12 bond street ']

address_array =[]
london_address.each_with_index do |street, i|
 
  address_array.push(['london', 'united kingdom', "#{street}"])
  
 
end
p address_array

puts 'creating flats'

10.times do |i|
  flat =Flat.create!(
    name: "name#{i}",
    description: "desc#{i}",
    number_of_bathrooms: (1..6).to_a.sample,
    number_of_bedrooms: (1..10).to_a.sample,
    wifi: boolean.sample,
    garden: boolean.sample,
    hot_tub: boolean.sample,
    parking: boolean.sample,
    kitchen: boolean.sample,
    tv: boolean.sample,
    aircon: boolean.sample,
    heating: boolean.sample,
    occupancy: (1..6).to_a.sample,
    price_per_night: (20..100).to_a.sample,
    address:  address_array[i][2],
    city:  address_array[i][0],
    country:  address_array[i][1],
    postcode: "pino#{i}",
    home_type: ["cottage", "house", "villa", "flat", "studio"].sample,
    user_id: [user1.id, user3.id, user2.id].sample
  )
 puts "name: ---#{flat.name}"
 
end

puts "finish creating flat"
