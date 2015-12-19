class AddGenreToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :genre, :string
  end
end
