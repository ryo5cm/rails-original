class AddGenreIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :genre_id, :integer
  end
end
