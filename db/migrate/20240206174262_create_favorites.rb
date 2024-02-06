class CreateFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :wine, null: false, foreign_key: true
      t.references :cheese, null: false, foreign_key: true

      t.timestamps
    end
  end
end
