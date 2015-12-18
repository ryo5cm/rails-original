class AddGenderToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :gender, :integer
  end
end
