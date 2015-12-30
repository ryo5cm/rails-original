class ReviewsController < ApplicationController

  # ログインしていない時は投稿できないようにする
  before_action :authenticate_user!, only:[:new, :create]
  before_action :set_picture, only:[:new, :create]

  def new
    @review = Review.new
  end

  def create
    if @picture.create(create_params)
      redirect_to picture_path(@picture)
    else
      render :new
    end
  end

  private
  def create_params
    params.require(:review).permit(:review).merge(picture_id: params[:picture_id], user_id: current_user.id)
  end

  def set_picture
    @picture = Picture.find(params[:picture_id])
  end
end
