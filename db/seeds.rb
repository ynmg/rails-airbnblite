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
flat1 = Listing.create!(location: "london", name: "Spacious flat in central London", description: "Cozy, sunlit one-bedroom nestled on the 3rd floor of a quiet building. Large windows flood the living room with natural light, highlighting the minimalist decor.", price: 100, number_guests: 2, user: user1, image_url:"https://blog.studios2let.com/wp-content/uploads/2021/04/fully-furnished-studio-flat-Penywern-earls-court.jpg", address: "1 Grosvenor Pl London SW1X 7HJ United Kingdom")
house1 = Listing.create!(location: "london", name: "Stylish House in London", description: "The kitchen is compact yet modern, featuring sleek countertops and stainless steel appliances. A small dining nook sits adjacent, perfect for intimate meals. ", price: 160, number_guests: 4, user: user2, image_url: "https://www.habituallychic.luxury/wp-content/uploads/2019/03/virginia-howard-london-flat-habituallychic-001-1024x683.jpg", address: "150 Piccadilly, London W1J 9BR United Kingdom")
flat2 = Listing.create!(location: "Rome", name: "Cozy and inviting space", description: "Lovely 1-bedroom offers a peaceful retreat with soft lighting and ample closet space.", price: 90, number_guests: 2, user: user2, image_url: "https://www.burghesius.com/wp-content/uploads/2023/03/2.-A-different-kind-of-luxury--scaled.jpg", address: "Via del Babuino 9 00187 Rome, Italy")
house2 = Listing.create!(location: "Rome", name: "House with panoramic view", description: "A charming two-story house with bright windows, a cozy porch, and a small garden. Inside, warm wooden floors and soft lighting create a welcoming atmosphere.", price: 140, number_guests: 4, user: user1, image_url: "https://media.architecturaldigest.com/photos/58bd9571c4c3d5312c9ba296/master/w_1600,c_limit/0812-AD-REBE-10.jpg", address: "Via del Babuino 9 00187 Rome, Italy")
flat3 = Listing.create!(location: "Seville", name: "Light-filled, tranquil flat", description: "A bright urban flat with private balcony, and smart interior design. Open living areas and clean lines offer a stylish, modern lifestyle.", price: 85, number_guests: 2, user: user1, image_url: "https://www.genteel-home.com/fotos/Gfoto820-11-genteel-home-pureza-apartment-seville-20241226-162034.jpg", address: "C. San Fernando, 2, Casco Antiguo, 41004 Sevilla, Spain")
flat4 = Listing.create!(location: "Seville", name: "Bright, modern city flat", description: "A modern home with open-plan living, floor-to-ceiling windows, and a stylish kitchen. Perfect for entertaining or relaxing in a sun-filled space.", price: 140, number_guests: 4, user: user2, image_url: "https://www.genteel-home.com/fotos/Gfoto820-24-genteel-home-pureza-apartment-seville-20241226-162254.jpg", address: "C. San Fernando, 2, Casco Antiguo, 41004 Sevilla, Spain")

puts "#{Listing.count} properties created!"

puts "Creating bookings..."
Booking.create!(start_date: "2025-05-10", end_date: "2025-05-20", user: user1, listing: flat1)
Booking.create!(start_date: "2025-05-10", end_date: "2025-05-20", user: user1, listing: house1)

puts "#{Booking.count} bookings created!"
