class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour_option

  enum status: {pending: 0, accepted: 1, declined: 2, paid: 3, canceled: 4}

  validates :person_num, presence: true, numericality: {only_integer: true}

  before_save :set_total_price

  private
  def set_total_price
    self.total_price = tour_option.tour.price * person_num
  end
end
