class RenameTypeToSoftnessInCheeses < ActiveRecord::Migration[7.1]
  def change
    rename_column :cheeses, :type, :softness
  end
end
