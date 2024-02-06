class Wine < ApplicationRecord
  has_many :pairing_tables
  has_many :cheeses, through: :pairing_tables
  has_many :favorites, as: :favorited_item
  has_many :favorited_by, through: :favorites, source: :user
end
