class CreateWines < ActiveRecord::Migration[7.1]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :family
      t.string :variety
      t.string :sweetness
      t.string :country
      t.string :region
      t.integer :year
      t.text :description

      t.timestamps
    end
  end
end
