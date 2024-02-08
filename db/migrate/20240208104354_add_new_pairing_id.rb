class AddNewPairingId < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :pairing_id, :integer
  end
end
