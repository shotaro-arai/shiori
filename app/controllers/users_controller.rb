class UsersController < ApplicationController
  before_action :move_action, only: [:edit, :update]
  before_action :move_action_b, only: [:edit, :update]

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

  private

  def move_action
    redirect_to root_path unless user_signed_in?
  end

  def move_action_b
    redirect_to root_path if current_user.id != User.find(params[:id]).id
  end
end
