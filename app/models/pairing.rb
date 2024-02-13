class Pairing < ApplicationRecord
  acts_as_favoritable
  has_many :reviews

#   belongs_to :wine Might just need this and not need the below.
#   belongs_to :cheese

  belongs_to :wine, foreign_key: 'wine_id'
  belongs_to :cheese, foreign_key: 'cheese_id'
  belongs_to :user, optional: true
  delegate :name, to: :wine, prefix: true
  delegate :name, to: :cheese, prefix: true

end
