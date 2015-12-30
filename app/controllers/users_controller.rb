class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @pictures = current_user.pictures.page(params[:page]).per(20).order('created_at DESC')
  end

  def edit
  end

  def update
    redirect_to controller: :pictures, action: :index
  end
end
