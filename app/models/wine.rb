class Wine < ApplicationRecord
  acts_as_favoritable

has_many :pairings
has_many :cheeses, through: :pairings
  has_many :users

end
