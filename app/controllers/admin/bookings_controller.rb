class Admin::BookingsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def update
    if params[:accept].nil?
      @booking.declined!
      flash[:success] = t "flash.bookings.decline_success"
    else
      @booking.accepted!
      flash[:success] = t "flash.bookings.accept_success"
    end
    redirect_to :back
  end
end
