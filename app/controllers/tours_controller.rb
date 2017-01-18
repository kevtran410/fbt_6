class ToursController < ApplicationController
  load_resource

  def index
    @tours = Tour.all
    render layout: "out_container"
  end

  def show
    @booking = Booking.new
  end
end
