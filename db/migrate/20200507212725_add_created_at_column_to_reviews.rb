class AddCreatedAtColumnToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :created_at, :timestamp
  end
end
