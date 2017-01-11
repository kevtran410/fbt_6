class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable
end
