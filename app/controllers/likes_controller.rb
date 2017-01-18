class LikesController < ApplicationController
  load_resource :tour
  load_resource :review, through: :tour
  load_and_authorize_resource :like, through: :review

  before_action :load_support

  def create
    @like.user = current_user
    if @like.save
      load_support
      flash[:success] = t "flash.review.like_success"
    else
      flash[:danger] = t "flash.review.like_fail"
    end

    respond_to do |format|
      format.html do
        redirect_to tour_review_path(@tour, @review)
      end
      format.js
    end
  end

  def destroy
    if @like.destroy
      load_support
      flash[:success] = t "flash.review.unlike_success"
    else
      flash[:danger] = t "flash.review.unlike_fail"
    end

    respond_to do |format|
      format.html do
        redirect_to tour_review_path(@tour, @review)
      end
      format.js
    end
  end

  private
  def load_support
    @supports = Supports::ReviewSupport.new review: @review, user: current_user
  end
end
