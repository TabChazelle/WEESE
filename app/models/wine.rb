class Wine < ApplicationRecord
  acts_as_favoritable

  has_many :pairings
  has_many :cheeses, through: :pairings
  validates :name, :type, :country, :grape, :description, presence: true
end
