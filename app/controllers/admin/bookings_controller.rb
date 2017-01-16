class Admin::BookingsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def update
    if params[:accept].nil?
      @booking.declined!
    else
      @booking.accepted!
    end
    redirect_to :back
  end
end
