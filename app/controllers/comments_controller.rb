class CommentsController < ApplicationController
  before_action :move_action, only:[:create]
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to book_path(@comment.book.id) 
      # render json:{comment: @comment}
    else
      @book = Book.find(params[:book_id])
      @comments = @book.comments.includes(:user)
      render 'books/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, book_id: params[:book_id])
  end

  def move_action
    unless user_signed_in?
      redirect_to root_path, alert: "ログインしてください"
    end
  end
end
