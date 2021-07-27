class LikesController < ApplicationController

  def create
    Like.create(user_id: current_user.id, book_id: params[:id])
  end
end
