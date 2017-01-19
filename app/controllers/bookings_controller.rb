class BookingsController < ApplicationController
  load_and_authorize_resource

  def create
    if current_user.bookings << @booking
      flash[:success] = t "flash.bookings.create_success"
      redirect_to @booking
    else
      flash[:danger] = t "flash.bookings.create_failed"
      redirect_to :back
    end
  end

  def show
  end

  private
  def booking_params
    params.require(:booking).permit :email, :phone, :person_num, :tour_option_id
  end
end
