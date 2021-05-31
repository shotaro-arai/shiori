class CommentsController < ApplicationController
  before_action :move_action, only: [:create, :destroy]
  before_action :move_action_b, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to book_path(@comment.book.id)
      # render json:{comment: @comment}
    else
      @book = Comment.find()
      @comments = @book.comments.includes(:user)
      render 'books/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:format])
    @comment.destroy
    redirect_to book_path(params[:book_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, book_id: params[:book_id])
  end

  def move_action
    redirect_to root_path, alert: 'ログインしてください。' unless user_signed_in?
  end

  def move_action_b
    redirect_to root_path if current_user.id != Comment.find(params[:format]).user_id
  end
end
