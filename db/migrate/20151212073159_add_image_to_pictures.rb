class AddImageToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :image, :text
  end
end
