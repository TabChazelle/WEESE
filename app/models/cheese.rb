class Cheese < ApplicationRecord
  has_many :pairings
  has_many :wines, through: :pairings
  validates :name, :softness, :country, :milk, presence: true
  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user
end
