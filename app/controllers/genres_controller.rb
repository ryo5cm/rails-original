class GenresController < ApplicationController

  def index
    @pictures = Picture.page(params[:page]).per(100).where(genre_id: params[:genre_id]).order("created_at DESC")
  end
end
