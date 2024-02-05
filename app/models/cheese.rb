class Cheese < ApplicationRecord
  has_many :pairing_tables
  has_many :wines, through: :pairing_tables
  validates :name, :type, :country, :milk, presence: true
end
