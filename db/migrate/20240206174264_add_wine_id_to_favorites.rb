class AddWineIdToFavorites < ActiveRecord::Migration[7.1]
  def change
    add_reference :favorites, :wine, null: false, foreign_key: true
  end
end
