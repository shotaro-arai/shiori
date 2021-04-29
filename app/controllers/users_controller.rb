class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
  end

  def edit
    @books = Book.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def update
  end

end
