class RemoveImageUrlFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :image_url, :text
  end
end
