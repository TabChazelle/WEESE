class AddDefaultToWine < ActiveRecord::Migration[7.1]
  def change
    change_column :wines, :image_url, :string, default: "https://source.unsplash.com/random/200x200?wine"
  end
end
