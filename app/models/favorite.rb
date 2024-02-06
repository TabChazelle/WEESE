# app/models/favorite.rb
class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :wine, optional: true
  belongs_to :cheese, optional: true
  belongs_to :pairing, optional: true
  belongs_to :favorited_item, polymorphic: true
end
