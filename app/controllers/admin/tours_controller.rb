class Admin::ToursController < ApplicationController
  load_and_authorize_resource

  rescue_from ActiveRecord::RecordNotFound do
    flash[:danger] = t "flash.tour.find_fail"
    redirect_to admin_tours_path
  end

  def index
  end

  def new
    @tour.tour_options.build
    @tour.tour_places.build
    @places = Place.all
  end

  def create
    if @tour.save
      flash[:success] = t "flash.tour.create_success"
      redirect_to [:admin, @tour]
    else
      flash.now[:danger] = t "flash.tour.create_failed"
      render :new
    end
  end

  def show
  end

  def edit
    @places = Place.all
  end

  def update
    if @tour.update_attributes tour_params
      flash[:success] = t "flash.tour.update_success"
      redirect_to [:admin, @tour]
    else
      flash.now[:danger] = t "flash.tour.update_failed"
      render :edit
    end
  end

  def destroy
    if @tour.destroy
      flash[:success] = t "flash.tour.destroy_success"
    else
      flash[:danger] = t "flash.tour.destroy_fail"
    end
    redirect_to admin_tours_path
  end

  private
  def tour_params
    params.require(:tour).permit Tour::ATTRIBUTE_PARAMS
  end
end
