class Wine < ApplicationRecord
  has_many :pairing_tables
  has_many :cheeses, through: :pairing_tables
end
