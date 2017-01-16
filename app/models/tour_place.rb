class TourPlace < ApplicationRecord
  belongs_to :tour, inverse_of: :tour_places
  belongs_to :place
end
