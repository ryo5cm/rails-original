class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only:[:edit, :update]

  def index
    @pictures = current_user.pictures.page(params[:page]).per(50).order('created_at DESC')
    @title1 = "いいね！した投稿"
    @title2 = "投稿一覧"
  end

  def show
  end

  def edit
  end

  def update
  end

  def like_pictures
    @pictures = current_user.like_pictures.page(params[:page]).per(50).order('created_at desc')
    @title2 = "いいね！した投稿"
    render :index
  end

  private
  def correct_user
    user = User.find(params[:id])
    if !current_user?(user)
      redirect_to root_path, alert: "許可されていないページです"
    end
  end
end
