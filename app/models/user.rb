
  class User < ApplicationRecord
    has_many :reviews
    has_many :favorites
    has_many :favorite_wines, through: :favorites, source: :wine
    has_many :favorite_cheeses, through: :favorites, source: :cheese
    has_many :favorite_pairings, through: :favorites, source: :pairing
    validates :username, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  end
