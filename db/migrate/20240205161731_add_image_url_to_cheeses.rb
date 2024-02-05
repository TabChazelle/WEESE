class AddImageUrlToCheeses < ActiveRecord::Migration[7.1]
  def change
    add_column :cheeses, :image_url, :string
  end
end
