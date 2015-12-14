class RemoveRateFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :rate, :integer
  end
end
