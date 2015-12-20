class RankingController < ApplicationController

  def index
      picture_ids = Review.group(:picture_id).order('count_picture_id DESC').limit(30).count(:picture_id).keys
      @ranking = picture_ids.map{ |id| Picture.find(id) }
      # @pictures = Picture.where(gender: params[:gender])
      @men = []
      @women = []
      @ranking.each do |ranking|
        if ranking.gender == 1
          @men << ranking
        elsif ranking.gender == 2
          @women << ranking
        end
      end
      @gender = params[:gender].to_i if params[:gender].present?
  end

end
