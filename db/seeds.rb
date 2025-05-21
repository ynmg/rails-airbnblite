# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# User.destroy_all
# Listing.destroy_all
# Booking.destroy_all

# puts "Creating users..."
# user1 = User.create!(email: "abc@gmail.com", password: "123456")
# user2 = User.create!(email: "123@gmail.com", password: "123456")
# puts "#{User.count} users created!"

# puts "Creating listings..."

# flat1 = Listing.create!(location: "london", name: "flat1", description: "1-bedroom flat in central London.", price: 100, number_guests: 2, user: user1)
# house1 = Listing.create!(location: "london", name: "house1", description: "2-bedroom house in central London.", price: 160, number_guests: 4, user: user2)
# flat2 = Listing.create!(location: "Rome", name: "flat1", description: "1-bedroom flat in Rome.", price: 90, number_guests: 2, user: user2)
# house2 = Listing.create!(location: "Rome", name: "house1", description: "2-bedroom house in Rome.", price: 140, number_guests: 4, user: user1)
# flat3 = Listing.create!(location: "Seville", name: "flat1", description: "1-bedroom flat in Seville.", price: 85, number_guests: 2, user: user1)
# house3 = Listing.create!(location: "Seville", name: "house1", description: "2-bedroom house in Seville.", price: 140, number_guests: 4, user: user2)
# puts "#{Listing.count} properties created!"

# puts "Creating bookings..."
# Booking.create!(start_date: "2025-05-10", end_date: "2025-05-20", user: user1, listing: flat1)
# Booking.create!(start_date: "2025-05-10", end_date: "2025-05-20", user: user1, listing: house1)

# puts "#{Booking.count} bookings created!"

# Listing.create!(location: "london", name: "flat1", description: "1-bedroom flat in central London.", price: 100, number_guests: 2, user: user1)
# Listing.create!(location: "london", name: "house1", description: "2-bedroom house in central London.", price: 160, number_guests: 4, user: user2)

# puts "#{Listing.count} properties created!"
