class RemoveCreatedAtFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :createdat, :timestamp
    remove_column :reviews, :updatedat, :timestamp
  end
end
