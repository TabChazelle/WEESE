class CreatePairings < ActiveRecord::Migration[7.1]
  def change
    create_table :pairings do |t|
      t.references :wines, null: false, foreign_key: true
      t.references :cheeses, null: false, foreign_key: true

      t.timestamps
    end
  end
end
