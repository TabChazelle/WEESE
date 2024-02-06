class Wine < ApplicationRecord
  has_many :pairings
  has_many :cheeses, through: :pairings
end
