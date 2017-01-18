class Tour < ApplicationRecord
  has_many :tour_places, inverse_of: :tour
  has_many :places, through: :tour_places
  has_many :tour_options, dependent: :destroy, inverse_of: :tour
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :content, presence: true
  validates :duration, presence: true, numericality: {only_integer: true}
  validates :price, presence: true, numericality: true

  ATTRIBUTE_PARAMS = [:name, :duration, :price, :content,
    tour_options_attributes: [:id, :person_quantity, :start_date, :_destroy],
    tour_places_attributes: [:id, :place_id, :_destroy]]

  accepts_nested_attributes_for :tour_options, allow_destroy: true,
    reject_if: lambda {|attribute| attribute[:start_date].blank?}
  accepts_nested_attributes_for :tour_places, allow_destroy: true,
    reject_if: lambda {|attribute| attribute[:place_id].blank?}

  ratyrate_rateable "quality"
end
