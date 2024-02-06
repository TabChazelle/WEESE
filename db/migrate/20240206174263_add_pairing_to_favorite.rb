class AddPairingToFavorite < ActiveRecord::Migration[7.1]
  def change
    add_reference :favorites, :pairing, null: false, foreign_key: true
  end
end
