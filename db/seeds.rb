# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(
  name: "John Doe",
  email: "admin@gmail.com",
  encrypted_password: "admin123",
  password: "admin123",
)

Place.create!(
  description: "CrystalRock Beach Hotel",
  photo: "https://images.pexels.com/photos/3703465/pexels-photo-3703465.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  location: "Mauritius",
  rate: 4,
  address: "17 Palm Beach Avenue Tropical Paradise, Port Louis Mauritius",
  pricepernight: 100,
  user_id: User.first.id,
)

Place.create!(
  description: "Dolphinhotel",
  photo: "https://images.pexels.com/photos/1458457/pexels-photo-1458457.jpeg?auto=compress&cs=tinysrgb&w=600",
  location: "Cape Town, South Africa",
  rate: 4,
  address: "42 Ocean View Road, Cape Town, South Africa",
  pricepernight: 150,
  user_id: User.first.id,
)

Place.create!(
  description: "Crystal Waters Miami Beach hotel",
  photo: "https://images.pexels.com/photos/1802255/pexels-photo-1802255.jpeg?auto=compress&cs=tinysrgb&w=600",
  location: "Miami, Florida",
  rate: 4,
  address: "789 Ocean Drive Miami Beach, FL 33139 United States",
  pricepernight: 200,
  user_id: User.first.id,
)

Place.create!(
  description: "Capetown Hights Hotel",
  photo: "https://images.pexels.com/photos/2096983/pexels-photo-2096983.jpeg?auto=compress&cs=tinysrgb&w=600",
  location: "Cape Town, South Africa",
  rate: 5,
  address: "42 Table Mountain Avenue Cape Town Central, 8001 South Africa",
  pricepernight: 250,
  user_id: User.first.id,
)

Place.create!(
  description: "Maldives Bungelos",
  photo: "https://images.pexels.com/photos/1287460/pexels-photo-1287460.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  location: "Maldives",
  rate: 5,
  address: "23 Coral Reef Street Blue Lagoon Island Maldives",
  pricepernight: 300,
  user_id: User.first.id,
)

Place.create!(
  description: "Thailand Patong Huts",
  photo: "https://images.pexels.com/photos/1838554/pexels-photo-1838554.jpeg?auto=compress&cs=tinysrgb&w=600",
  location: "Thailand",
  rate: 4,
  address: "72 Soi Thai Orchid, Sukhumvit Road Bangkok 10110 Thailand",
  pricepernight: 200,
  user_id: User.first.id,
)

Place.create!(
  description: "Greece Seaview Whitesands",
  photo: "https://images.pexels.com/photos/895555/pexels-photo-895555.jpeg?auto=compress&cs=tinysrgb&w=600",
  location: "Greece",
  rate: 4,
  address: "12 Aegean Street Pyros, Santorini 84700 Greece",
  pricepernight: 150,
  user_id: User.first.id,
)

Place.create!(
  description: "Accra Mountainview Hotel",
  photo: "https://images.pexels.com/photos/221457/pexels-photo-221457.jpeg?auto=compress&cs=tinysrgb&w=600",
  location: "Ghana",
  rate: 4,
  address: "38 Golden Avenue Kwame Nkrumah Circle Accra, Ghana",
  pricepernight: 100,
  user_id: User.first.id,
)

Place.create!(
  description: "Cloudy9 Hotel",
  photo: "https://images.pexels.com/photos/261102/pexels-photo-261102.jpeg?auto=compress&cs=tinysrgb&w=600",
  location: "Cape Town, South Africa",
  rate: 4,
  address: "16 Table Mountain Avenue Cape Town Central, 8001 South Africa",
  pricepernight: 200,
  user_id: User.first.id,
)

Place.create!(
  description: "Thailand Patong Jungle hotel",
  photo: "https://images.pexels.com/photos/3225531/pexels-photo-3225531.jpeg?auto=compress&cs=tinysrgb&w=600",
  location: "Thailand",
  rate: 3,
  address: "45 Coconut Lane, Patong Beach Phuket 83150 Thailand",
  pricepernight: 150,
  user_id: User.first.id,
)

