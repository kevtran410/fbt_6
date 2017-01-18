class Supports::ReviewSupport
  def initialize params
    @review = params[:review]
    @user = params[:user]
    parent_id = params[:parent_id]
    @parent_comment = @review.comments.find_by id: parent_id
  end

  def comments
    @comments = @review.comments.roots.order_desc
  end

  def comment
    @comment = @parent_comment ?
      @parent_comment.children.build : @review.comments.build
  end

  def like
    @like = @review.likes.find_by(user: @user) || @review.likes.build
  end

  def parent_comment
    @parent_comment
  end
end
