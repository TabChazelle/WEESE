class Cheese < ApplicationRecord
  acts_as_favoritor
  has_many :pairings
  has_many :wines, through: :pairings
  validates :name, :softness, :country, :milk, presence: true

end
