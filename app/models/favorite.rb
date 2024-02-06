class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :wine
  belongs_to :cheese
  belongs_to :pairing
end
