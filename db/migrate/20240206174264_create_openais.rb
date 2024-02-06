class CreateOpenais < ActiveRecord::Migration[7.1]
  def change
    create_table :openais do |t|

      t.timestamps
    end
  end
end
