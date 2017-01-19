class TourOption < ApplicationRecord
  belongs_to :tour, inverse_of: :tour_options

  has_many :bookings

  enum status: {active: 0, expired: 1, canceled: 2}

  before_save :check_cancel

  private
  def check_cancel
    if status == "canceled" && status_was != "canceled"
      CancelTourWorker.perform_async id
    end
  end
end
