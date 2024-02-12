class Pairing < ApplicationRecord
  acts_as_favoritable
  has_many :reviews
  belongs_to :wine
  belongs_to :cheese
end
