class ToursController < ApplicationController
  load_resource

  def show
    @booking = Booking.new
  end
end
