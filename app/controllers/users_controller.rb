class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
  end
end
