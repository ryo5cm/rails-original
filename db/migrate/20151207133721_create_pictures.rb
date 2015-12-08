class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string    :title
      t.text      :image_url
      t.string    :comment
      t.timestamps
    end
  end
end
