# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Listing.destroy_all
Booking.destroy_all

puts "Creating users..."
user1 = User.create!(email: "abc@gmail.com", password: "123456")
user2 = User.create!(email: "123@gmail.com", password: "123456")
puts "#{User.count} users created!"

puts "Creating listings..."

flat1 = Listing.create!(location: "london", name: "flat1", description: "Our home has everything you need to make the most of your short stay in London. The fridge is fully stocked with breakfast items and luxury items are provided free of charge for the bathroom. Enjoy your stay!", price: 100, number_guests: 2, user: user1, image_url:"https://blog.studios2let.com/wp-content/uploads/2021/04/fully-furnished-studio-flat-Penywern-earls-court.jpg")
house1 = Listing.create!(location: "london", name: "house1", description: "2-bedroom house in central London.", price: 160, number_guests: 4, user: user2, image_url: "https://www.habituallychic.luxury/wp-content/uploads/2019/03/virginia-howard-london-flat-habituallychic-001-1024x683.jpg")
flat2 = Listing.create!(location: "Rome", name: "flat1", description: "1-bedroom flat in Rome.", price: 90, number_guests: 2, user: user2, image_url: "https://i.guim.co.uk/img/media/ea97687745a051e42eb7ca98446d475c5d38fedb/0_52_5760_3456/master/5760.jpg?width=1300&dpr=2&s=none&crop=none")
house2 = Listing.create!(location: "Rome", name: "house1", description: "2-bedroom house in Rome.", price: 140, number_guests: 4, user: user1, image_url: "https://media.architecturaldigest.com/photos/58bd9571c4c3d5312c9ba296/master/w_1600,c_limit/0812-AD-REBE-10.jpg")
flat3 = Listing.create!(location: "Seville", name: "flat1", description: "1-bedroom flat in Seville.", price: 85, number_guests: 2, user: user1, image_url: "https://media.cntraveller.com/photos/65e1c2d2020f3a2ed65aefc2/16:9/w_1920%2Cc_limit/A%2520luxury%2520duplex%2520overlooking%2520the%2520cathedral%2520-airbnb-seville-feb24-pr.jpeg")
house3 = Listing.create!(location: "Seville", name: "house1", description: "2-bedroom house in Seville.", price: 140, number_guests: 4, user: user2, image_url: "https://hips.hearstapps.com/hmg-prod/images/amaro-sanchez-de-moya-seville-apartment-living-room-67f0152b5cfb4.jpg?crop=1xw:0.843644544431946xh;center,top&resize=2048:*")
puts "#{Listing.count} properties created!"

puts "Creating bookings..."
Booking.create!(start_date: "2025-05-10", end_date: "2025-05-20", user: user1, listing: flat1)
Booking.create!(start_date: "2025-05-10", end_date: "2025-05-20", user: user1, listing: house1)

puts "#{Booking.count} bookings created!"
