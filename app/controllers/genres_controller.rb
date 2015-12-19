class GenresController < ApplicationController

  def index
    @pictures = Picture.page(params[:page]).per(100).where().order("created_at DESC")
  end
end
