class PicturesController < ApplicationController

  # ログインしていない時は投稿できないようにする
  before_action :authenticate_user!, only: :new

  def index
    @pictures = Picture.page(params[:page]).per(20).order("created_at DESC")
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to controller: :pictures, action: :index
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :comment)
  end

end
