class CommentsController < ApplicationController
  load_resource :tour
  load_resource :review
  load_and_authorize_resource :comment, through: :review,
    param_method: :comment_params

  before_action :load_supports

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by id: params[:comment].delete(:parent_id)
      @comment = parent.children.build comment_params
      @comment.review = parent.review
    end
    @comment.user = current_user
    if @comment.save
      load_supports
      respond_to do |format|
        format.html do
          flash[:success] = t "flash.comment.comment_success"
          redirect_to tour_review_path @tour, @review
        end
        format.js
      end
    else
      flash[:danger] = t "flash.comment.comment_fail"
      redirect_to tour_review_path @tour, @review
    end
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :review_id, :user_id, :parent_id
  end

  def load_supports
    @supports = Supports::ReviewSupport.new review: @review, user: current_user,
      parent_id: params[:parent_id]
  end
end
