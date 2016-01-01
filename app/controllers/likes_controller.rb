class LikesController < ApplicationController

  def like
    picture = Picture.find(params[:picture_id])
    like = current_user.likes.build(picture_id: picture.id)
    like.save
  end

  def unlike

  end
end
