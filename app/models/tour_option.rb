class TourOption < ApplicationRecord
  belongs_to :tour, inverse_of: :tour_options

  has_many :bookings
end
