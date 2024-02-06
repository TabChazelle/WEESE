class CreateFavoriteFavoritables < ActiveRecord::Migration[7.1]
  def change
    create_table :favorite_favoritables do |t|
      t.references :favoritor, polymorphic: true, null: false
      t.references :favorite, polymorphic: true, null: false
      t.string :scope

      t.timestamps
    end
  end
end
