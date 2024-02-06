class Pairing < ApplicationRecord
  belongs_to :wines
  belongs_to :cheeses
end
