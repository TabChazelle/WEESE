# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Array of wine data

Pairing.destroy_all
Wine.destroy_all
Cheese.destroy_all

wines = [
  { name: "Cabernet Sauvignon", family: "Cabernet", variety: "Red", sweetness: "Dry", country: "France", region: "Bordeaux", year: 2015, description: "A full-bodied red wine.", image_url: "https://source.unsplash.com/random/200x200?wine" },
  { name: "Merlot", family: "Merlot", variety: "Red", sweetness: "Medium", country: "France", region: "Bordeaux", year: 2016, description: "A soft, medium-bodied red wine.", image_url: "https://source.unsplash.com/random/200x200?wine" },
  { name: "Pinot Noir", family: "Pinot", variety: "Red", sweetness: "Dry", country: "France", region: "Burgundy", year: 2017, description: "A light-bodied red wine.", image_url: "https://source.unsplash.com/random/200x200?wine" },
  { name: "Chardonnay", family: "Chardonnay", variety: "White", sweetness: "Dry", country: "France", region: "Burgundy", year: 2018, description: "A full-bodied white wine.", image_url: "https://source.unsplash.com/random/200x200?wine" },
  { name: "Sauvignon Blanc", family: "Sauvignon", variety: "White", sweetness: "Dry", country: "France", region: "Loire Valley", year: 2019, description: "A light-bodied white wine.", image_url: "https://source.unsplash.com/random/200x200?wine" },
  { name: "Pinot Grigio", family: "Pinot", variety: "White", sweetness: "Dry", country: "Italy", region: "Veneto", year: 2020, description: "A light-bodied white wine.", image_url: "https://source.unsplash.com/random/200x200?wine" },
  { name: "Zinfandel", family: "Zinfandel", variety: "Red", sweetness: "Sweet", country: "United States", region: "California", year: 2021, description: "A medium-bodied red wine.", image_url: "https://source.unsplash.com/random/200x200?wine" },
  { name: "Syrah", family: "Syrah", variety: "Red", sweetness: "Dry", country: "France", region: "Rhône Valley", year: 2022, description: "A full-bodied red wine.", image_url: "https://source.unsplash.com/random/200x200?wine" },
  { name: "Riesling", family: "Riesling", variety: "White", sweetness: "Sweet", country: "Germany", region: "Mosel", year: 2023, description: "A light-bodied white wine.", image_url: "https://source.unsplash.com/random/200x200?wine" },
  { name: "Champagne", family: "Champagne", variety: "Sparkling", sweetness: "Dry", country: "France", region: "Champagne", year: 2024, description: "A sparkling white wine.", image_url: "https://source.unsplash.com/random/200x200?wine" },
]

# Array of cheese data
cheeses = [
  { name: "Cheddar", softness: "Hard", country: "England", region: "Somerset", milk: "Cow", description: "A hard, sharp cheese.", image_url: "https://source.unsplash.com/random/200x200?cheese" },
  { name: "Brie", softness: "Soft", country: "France", region: "Île-de-France", milk: "Cow", description: "A soft, creamy cheese.", image_url: "https://source.unsplash.com/random/200x200?cheese" },
  { name: "Gouda", softness: "Semi-Hard", country: "Netherlands", region: "South Holland", milk: "Cow", description: "A mild, nutty cheese.", image_url: "https://source.unsplash.com/random/200x200?cheese" },
  { name: "Roquefort", softness: "Blue", country: "France", region: "Roquefort-sur-Soulzon", milk: "Sheep", description: "A tangy, crumbly cheese.", image_url: "https://source.unsplash.com/random/200x200?cheese" },
  { name: "Mozzarella", softness: "Fresh", country: "Italy", region: "Campania", milk: "Buffalo", description: "A soft, stretchy cheese.", image_url: "https://source.unsplash.com/random/200x200?cheese" },
  { name: "Feta", softness: "Brined", country: "Greece", region: "Thessaly", milk: "Sheep", description: "A salty, crumbly cheese.", image_url: "https://source.unsplash.com/random/200x200?cheese" },
  { name: "Parmesan", softness: "Hard", country: "Italy", region: "Parma", milk: "Cow", description: "A hard, granular cheese.", image_url: "https://source.unsplash.com/random/200x200?cheese" },
  { name: "Swiss", softness: "Hard", country: "Switzerland", region: "Emmental", milk: "Cow", description: "A medium-hard cheese with distinctive holes.", image_url: "https://source.unsplash.com/random/200x200?cheese" },
  { name: "Camembert", softness: "Soft", country: "France", region: "Normandy", milk: "Cow", description: "A soft, creamy, surface-ripened cow's milk cheese.", image_url: "https://source.unsplash.com/random/200x200?cheese" },
  { name: "Stilton", softness: "Blue", country: "England", region: "Derbyshire, Leicestershire, and Nottinghamshire", milk: "Cow", description: "An English cheese, known for its characteristic strong smell and taste.", image_url: "https://source.unsplash.com/random/200x200?cheese" },
]

# Create the wines
wines.each do |wine|
  Wine.create(wine)
end

# Create the cheeses
cheeses.each do |cheese|
  Cheese.create(cheese)
end

wines = Wine.all
cheeses = Cheese.all

# Create pairings
wines.each do |wine|
  cheese = cheeses.sample # Randomly select a cheese
  Pairing.create(wine_id: wine.id, cheese_id: cheese.id)
end
