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

# Pairing.destroy_all
Wine.destroy_all
Cheese.destroy_all

wines = [
  { name: "Cabernet Sauvignon", family: "Cabernet", variety: "Red", sweetness: "Dry", country: "France", region: "Bordeaux", year: 2015, description: "A full-bodied red wine.", image_url: "https://digitalcontent.api.tesco.com/v2/media/ghs/d3a661ce-5e03-480b-9268-961257528a71/059a5b9c-0b15-4946-81e7-af3fac4e09e9_1614660029.jpeg?h=960&w=960" },
  { name: "Merlot", family: "Merlot", variety: "Red", sweetness: "Medium", country: "France", region: "Bordeaux", year: 2016, description: "A soft, medium-bodied red wine.", image_url: "https://digitalcontent.api.tesco.com/v2/media/ghs/5c843d52-96bb-408d-8bba-14b4fcde40da/8861e854-a881-4d26-ad7a-436c6fa6caae_306931222.jpeg?h=960&w=960" },
  { name: "Pinot Noir", family: "Pinot", variety: "Red", sweetness: "Dry", country: "France", region: "Burgundy", year: 2017, description: "A light-bodied red wine.", image_url: "https://www.lekkerwines.co.uk/media/catalog/product/cache/7aba2ea46b28cbe46b8945ccdbdf44a2/b/o/boschendal_appellation_elgin_pinot_noir.jpg" },
  { name: "Chardonnay", family: "Chardonnay", variety: "White", sweetness: "Dry", country: "France", region: "Burgundy", year: 2018, description: "A full-bodied white wine.", image_url: "https://liquidindulgence.co.uk/wp-content/uploads/US-11th-Hour-Chardonnay.jpg" },
  { name: "Sauvignon Blanc", family: "Sauvignon", variety: "White", sweetness: "Dry", country: "France", region: "Loire Valley", year: 2019, description: "A light-bodied white wine.", image_url: "https://www.kwoff.co.uk/cdn/shop/products/NewProject_11_2ba06074-e1ae-4939-8d78-0bd96fb33729_1024x1024.jpg?v=1651836795" },
]

# Array of cheese data
cheeses = [
  { name: "Brie", softness: "Soft", country: "France", region: "Île-de-France", milk: "Cow", description: "A soft, creamy cheese.", image_url: "https://upload.wikimedia.org/wikipedia/commons/8/88/Brie_01.jpg" },
  { name: "Mozzarella", softness: "Fresh", country: "Italy", region: "Campania", milk: "Buffalo", description: "A soft, stretchy cheese.", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Mozzarella_di_bufala3.jpg/1200px-Mozzarella_di_bufala3.jpg" },
  { name: "Swiss", softness: "Hard", country: "Switzerland", region: "Emmental", milk: "Cow", description: "A medium-hard cheese with distinctive holes.", image_url: "https://www.foodandwine.com/thmb/t-0AlYwHrzDhh_YxxJQRRLYuQ8Q=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-71285433-2000-0888f731cdbb4f0e9236ea9f43bdf930.jpg" },
  { name: "Stilton", softness: "Blue", country: "United Kingdom", region: "Various", milk: "Cow", description: "An English cheese, known for its characteristic strong smell and taste.", image_url: "https://upload.wikimedia.org/wikipedia/commons/f/f3/Blue_Stilton_01.jpg" },
]

team_favorite_cheeses = [
  { name: "Roquefort", softness: "Blue", country: "France", region: "Roquefort-sur-Soulzon", milk: "Sheep", description: "A tangy, crumbly cheese.", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Wikicheese_-_Roquefort_-_20150417_-_003.jpg/1200px-Wikicheese_-_Roquefort_-_20150417_-_003.jpg" },
  { name: "Easy Cheese", softness: "Processed", country: "United States", region: "Florida", milk: "Cow", description: "A disgrace.", image_url: "https://americansweets.co.uk/media/catalog/product/cache/6b10d57cd8d541100491edcb64c52781/e/a/easy-cheese-cheddar_1.png" },
  { name: "Feta", softness: "Brined", country: "Greece", region: "Thessaly", milk: "Sheep", description: "A salty, crumbly cheese.", image_url: "https://images.immediate.co.uk/production/volatile/sites/30/2020/03/feta-2d63606.jpg?quality=90&resize=556,505" },
  { name: "Parmesan", softness: "Hard", country: "Italy", region: "Parma", milk: "Cow", description: "A hard, granular cheese.", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Grana_Padano_DOP.jpg/800px-Grana_Padano_DOP.jpg" },
  { name: "Camembert", softness: "Soft", country: "France", region: "Normandy", milk: "Cow", description: "A soft, creamy, surface-ripened cow's milk cheese.", image_url: "https://upload.wikimedia.org/wikipedia/commons/d/dd/Camembert_de_Normandie_%28AOP%29_11.jpg" }
]

team_favorite_wines = [
  { name: "Chablis", family: "Chablis", variety: "White", sweetness: "Dry", country: "France", region: "Burgundy", year: 2015, description: "A crisp white wine with minerality.", image_url: "https://media.tanners-wines.co.uk/media/catalog/product/cache/315553dad97819a47858104fe3488849/b/w/bw017.jpg" },
  { name: "Petrus", family: "Petrus", variety: "Red", sweetness: "Dry", country: "France", region: "Pomerol", year: 2010, description: "A highly sought-after Bordeaux wine.", image_url: "https://hedonism.co.uk/sites/default/files/vintner/vintner-images/HED3672.JPG" },
  { name: "Screaming Eagle", family: "Screaming Eagle", variety: "Red", sweetness: "Dry", country: "United States", region: "Napa Valley", year: 2016, description: "An iconic Napa Valley Cabernet Sauvignon.", image_url: "https://media.bbr.com/s/bbr/20128115681-ms?img404=Default_Wine" },
  { name: "Pingus", family: "Pingus", variety: "Red", sweetness: "Dry", country: "Spain", region: "Ribera del Duero", year: 2012, description: "A highly-regarded Spanish wine.", image_url: "https://cdn.vinissimus.com/img/unsafe/p385x/plain/local:///prfmtgrande/vi/dpin20p_anv800_1675682241.png" },
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
# wines.each do |wine|
#   cheese = cheeses.sample # Randomly select a cheese
#   Pairing.create(wine_id: wine.id, cheese_id: cheese.id)

# end

team_favorite_cheeses.each do |cheese_data|
  cheese_data = Cheese.find_or_create_by(name: cheese_data[:name]) do |c|
    c.softness = cheese_data[:softness]
    c.country = cheese_data[:country]
    c.region = cheese_data[:region]
    c.milk = cheese_data[:milk]
    c.description = cheese_data[:description]
    c.image_url = cheese_data[:image_url]
  end
end

team_favorite_wines.each do |wine_data|
  wine_data = Wine.find_or_create_by(name: wine_data[:name]) do |w|
    w.family = wine_data[:family]
    w.variety = wine_data[:variety]
    w.sweetness = wine_data[:sweetness]
    w.country = wine_data[:country]
    w.region = wine_data[:region]
    w.year = wine_data[:year]
    w.description = wine_data[:description]
    w.image_url = wine_data[:image_url]
  end
end
