class UsersController < ApplicationController

  def show
    @user = current_user
    @pictures = current_user.pictures.page(params[:page]).per(7).order('created_at DESC')
  end

  def edit
  end

  def update
  end
end
