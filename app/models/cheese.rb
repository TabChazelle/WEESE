class Cheese < ApplicationRecord
  has_many :pairings
  has_many :wines, through: :pairings
  validates :name, :softness, :country, :milk, presence: true
end
