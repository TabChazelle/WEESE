
  class User < ApplicationRecord
    acts_as_favoritor
    has_many :reviews
    has_one_attached :photo

    validates :username, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  end
