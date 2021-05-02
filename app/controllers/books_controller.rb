class BooksController < ApplicationController
  before_action :move_action, only:[:new, :create]

  def index
    @books = Book.all.order("created_at DESC")
  end
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.valid? 
      @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
    @comment = Comment.new
    @comments = @book.comments.includes(:user).order("created_at DESC")
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to edit_user_path
  end
    

  private
  
  def book_params
    params.require(:book).permit(:text,:quote,:title,:title_option, :author,:publish,:year,:page, :image).merge(user_id: params[:format])
  end

  def move_action
    unless user_signed_in?
      redirect_to root_path, alert: "ログインしてください"
    end
  end
end
