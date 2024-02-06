class Pairing < ApplicationRecord
  belongs_to :wines
  belongs_to :cheeses
  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user
end
