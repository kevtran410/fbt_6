class ReviewsController < ApplicationController
  load_resource :tour
  load_and_authorize_resource :review, through: :tour,
    param_method: :review_params

  before_action :authenticate_user!, only: [:new, :create]

  def create
    @review.user = current_user
    if @review.save
      flash[:success] = t "flash.review.create_sucess"
      redirect_to @tour
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit :name, :content, :tour_id
  end
end
