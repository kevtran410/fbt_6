class ToursController < ApplicationController
  load_resource

  def index
    @tours_count = Tour.all.size
    @search = Tour.ransack params[:q]
    @tours = @search.result.includes :places, :tour_options
    render layout: "out_container"
  end

  def show
    @booking = Booking.new
    render layout: "out_container"
  end
end
