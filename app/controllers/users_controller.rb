class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only:[:edit, :update]

  def index
    @pictures = current_user.pictures.page(params[:page]).per(20).order('created_at DESC')
  end

  def show
  end

  def edit
  end

  def update
  end

  def like_notes

  end

  private
  def correct_user
    user = User.find(params[:id])
    if !current_user?(user)
      redirect_to root_path, alert: "許可されていないページです"
    end
  end
end
