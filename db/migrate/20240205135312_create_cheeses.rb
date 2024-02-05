class CreateCheeses < ActiveRecord::Migration[7.1]
  def change
    create_table :cheeses do |t|
      t.string :name
      t.string :type
      t.string :country
      t.string :region
      t.string :milk
      t.text :description

      t.timestamps
    end
  end
end
