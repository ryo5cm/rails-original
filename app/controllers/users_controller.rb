class UsersController < ApplicationController

  def show
    @user = current_user
    @pictures = current_user.pictures.page(params[:page]).per(5).order('created_at DESC')
  end
end
