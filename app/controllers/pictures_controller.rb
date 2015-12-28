class PicturesController < ApplicationController

  # ログインしていない時は投稿できないようにする
  before_action :authenticate_user!, only: :new

  # リクエストパラメータで指定されたページ番号 ( params[:page] ) を指定する
  def index
    if params[:gender].present?
      @pictures = Picture.page(params[:page]).per(100).where(gender: params[:gender]).order("created_at DESC")
    elsif params[:genre_id].present?
      @pictures = Picture.page(params[:page]).per(100).where(genre_id: params[:genre_id]).order("created_at DESC")
    else
      @pictures = Picture.page(params[:page]).per(100).order("created_at DESC")
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @user = current_user
  end

  def new
    @picture = Picture.new
  end

  def create
    if Picture.create(picture_params)
      redirect_to controller: :pictures, action: :index
    else
      render :new
    end
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :comment)
  end

  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
  end

end
