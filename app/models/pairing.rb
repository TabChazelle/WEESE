class Pairing < ApplicationRecord


belongs_to :wine, foreign_key: 'wines_id'
belongs_to :cheese, foreign_key: 'cheeses_id'
  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user

end
