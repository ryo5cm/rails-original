class RemoveGenreFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :genre, :string
  end
end
