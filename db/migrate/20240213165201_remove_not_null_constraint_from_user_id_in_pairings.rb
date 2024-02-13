class RemoveNotNullConstraintFromUserIdInPairings < ActiveRecord::Migration[7.1]
  def change
    change_column_null :pairings, :user_id, true
  end
end
