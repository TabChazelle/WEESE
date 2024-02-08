class Pairing < ApplicationRecord
  acts_as_favoritable
  has_many :reviews
  belongs_to :wine, foreign_key: 'wines_id'
  belongs_to :cheese, foreign_key: 'cheeses_id'
end
