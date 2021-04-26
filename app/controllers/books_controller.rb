class BooksController < ApplicationController

  def index
    @books = Book.all
  end
  
  def new
    @book = Book.new
  end

  def create
    binding.pry
    @book = Book.new(book_params)
    if @book.valid? 
      @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(:text,:quote,:title,:title_option, :author,:publish,:year,:page).merge(user_id: params[:format])
  end
end
