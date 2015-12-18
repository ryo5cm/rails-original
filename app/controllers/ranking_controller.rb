class RankingController < ApplicationController

  def ranking
    picture_ids = Review.group(:picture_id).order('count_picture_id DESC').count(:picture_id).keys
    @ranking = picture_ids.map{ |id| Picture.find(id) }
  end
end
