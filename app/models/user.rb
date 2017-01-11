class User < ApplicationRecord
  has_many :bookings
  has_many :reviews
  has_many :comments
  has_many :likes, as: :likable

  devise :database_authenticatable, :registerable,
    :validatable, :omniauthable
end
