class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t| 
      t.integer :user_id
      t.integer :beer_id
      t.float :rating
      t.string :description
    end
  end
end
