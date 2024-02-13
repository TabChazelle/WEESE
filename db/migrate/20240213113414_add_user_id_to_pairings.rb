class AddUserIdToPairings < ActiveRecord::Migration[7.1]
  def change
    add_reference :pairings, :user, null: false, foreign_key: true
  end
end
