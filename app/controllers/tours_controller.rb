class ToursController < ApplicationController
  load_resource

  def index
    @search = Tour.ransack params[:q]
    @tours = @search.result.includes :places, :tour_options
    render layout: "out_container"
  end

  def show
    @booking = Booking.new
  end
end
