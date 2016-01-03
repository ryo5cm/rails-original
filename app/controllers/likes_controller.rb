class LikesController < ApplicationController

  def like
    picture = Picture.find(params[:picture_id])
    like = current_user.likes.build(picture_id: picture.id)
    like.save
    redirect_to picture
  end

  def unlike
    picture = Picture.find(params[:picture_id])
    like = current_user.likes.find_by(picture_id: picture.id)
    like.destroy
    redirect_to picture
  end
end
