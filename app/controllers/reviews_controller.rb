class ReviewsController < ApplicationController

  # ログインしていない時は投稿できないようにする
  before_action :authenticate_user!, only: :new

  def new
    @picture = Picture.find(params[:picture_id])
    @review = Review.new
  end

  def create
  end

end
