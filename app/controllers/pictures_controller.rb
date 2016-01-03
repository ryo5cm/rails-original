class PicturesController < ApplicationController

  # ログインしていない時は投稿できないようにする
  before_action :authenticate_user!, only:[:new, :edit]
  before_action :set_picture, only:[:show, :edit, :liking_users]

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
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    @picture.gender = current_user.gender
    if @picture.save
      redirect_to pictures_path, notice: "投稿が保存されました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to @picture, notice: "投稿が更新されました"
    else
      render :edit
    end
  end

  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
  end

  def liking_users
    @users = @picture.liking_users
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image, :comment, :genre_id)
  end

end
