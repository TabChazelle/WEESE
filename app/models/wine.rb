class Wine < ApplicationRecord

has_many :pairings
has_many :cheeses, through: :pairings
  has_many :favorites, as: :favorited_item
  has_many :favorited_by, through: :favorites, source: :user

end
