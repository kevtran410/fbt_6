class Tour < ApplicationRecord
  has_many :tour_places
  has_many :places, through: :tour_places
  has_many :tour_options, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
