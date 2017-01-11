class TourOption < ApplicationRecord
  belongs_to :tour

  has_many :bookings
end
