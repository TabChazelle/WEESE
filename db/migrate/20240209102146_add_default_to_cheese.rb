class AddDefaultToCheese < ActiveRecord::Migration[7.1]
  def change
    change_column :cheeses, :image_url, :string, default: "https://source.unsplash.com/random/200x200?cheese"
  end
end
