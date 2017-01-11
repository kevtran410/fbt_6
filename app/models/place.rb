class Place < ApplicationRecord
  has_many :tour_places
  has_many :tours, through: :tour_places

  acts_as_tree
end
