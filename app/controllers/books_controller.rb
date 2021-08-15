class BooksController < ApplicationController
  before_action :move_action, only: [:new, :create, :show]
  before_action :move_action_b, only: [:destroy]

  def index
    @books = Book.all.order('created_at DESC').page(params[:page]).per(3)
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
    @comments = @book.comments.includes(:user).order('created_at DESC')
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    @user = User.find(params[:id])
    redirect_to edit_user_path
  end

  def search
    if params[:q][:genre_id_eq]=="0"
      params[:q][:genre_id_eq] = ""
      @q = Book.ransack(params[:q])
    end
    @results = @q.result.order('created_at DESC')
  end

  private

  def book_params
    params.require(:book).permit(:text, :quote, :title, :title_option, :author, :publish, :year, :page,
                                 :image, :genre_id).merge(user_id: params[:format])
  end

  def move_action
    redirect_to root_path, alert: 'ログインしてください。' unless user_signed_in?
  end

  def move_action_b
    redirect_to root_path if current_user.id != Book.find(params[:id]).user_id
  end
end
