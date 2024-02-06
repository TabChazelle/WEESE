class Wine < ApplicationRecord
  acts_as_favoritor

has_many :pairings
has_many :cheeses, through: :pairings
  has_many :users

end
