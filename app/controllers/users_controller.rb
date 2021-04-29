class UsersController < ApplicationController
  before_action :move_action, only:[:edit, :update]

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

  def move_action
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
