class AddImageUrlToWines < ActiveRecord::Migration[7.1]
  def change
    add_column :wines, :image_url, :string
  end
end
