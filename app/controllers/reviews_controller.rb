class ReviewsController < ApplicationController

  # ログインしていない時は投稿できないようにする
  before_action :authenticate_user!, only:[:new, :create]

  def new
    @picture = Picture.find(params[:picture_id])
    @review = Review.new
  end

  def create
    Review.create(create_params)
    redirect_to controller: :pictures, action: :index
  end

  private
  def create_params
    params.require(:review).permit(:review).merge(picture_id: params[:picture_id], user_id: current_user.id)
  end
end
