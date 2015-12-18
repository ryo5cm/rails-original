class RankingController < ApplicationController

  def index
    picture_ids = Review.group(:picture_id).order('count_picture_id DESC').count(:picture_id).keys
    @ranking = picture_ids.map{ |id| Picture.find(id) }

    @pictures = Picture.page(params[:page]).per(100).order("created_at DESC")
  end

end
