class UsersController < ApplicationController

  def show
    @user = current_user
    @pictures = current_user.pictures.page(params[:page]).per(7).order('created_at DESC')
  end

  def edit
    @user = current_user
  end

  def update
    redirect_to controller: :pictures, action: :index
  end
end
