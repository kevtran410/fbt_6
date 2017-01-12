class Admin::PlacesController < ApplicationController
  load_and_authorize_resource except: [:index, :new]

  rescue_from ActiveRecord::RecordNotFound do
    flash[:danger] = t "flash.place.find_fail"
    redirect_to admin_places_path
  end

  def index
    @places = Place.hash_tree
  end

  def new
    @place = Place.new parent_id: params[:parent_id]
  end

  def create
    if @place.save
      flash[:success] = t "flash.place.create_success"
      redirect_to admin_places_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @place.update_attributes place_params
      flash[:success] = t "flash.place.update_success"
      redirect_to admin_places_path
    else
      render :edit
    end
  end

  def destroy
    if @place.destroy
      flash[:success] = t "flash.place.destroy_success"
    else
      flash[:danger] = t "flash.place.destroy_fail"
    end
    redirect_to admin_places_path
  end

  private
  def place_params
    params.require(:place).permit :name, :description, :parent_id
  end
end
