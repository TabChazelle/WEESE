
  class User < ApplicationRecord
    acts_as_favoritor
    has_many :reviews
    has_many :pairings
    has_one_attached :photo

    has_many :favorite_wines, through: :favorites, source: :favoritable, source_type: 'Wine'
    has_many :favorite_cheeses, through: :favorites, source: :favoritable, source_type: 'Cheese'
    has_many :favorite_pairings, through: :favorites, source: :favoritable, source_type: 'Pairing'


    validates :username, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  end
