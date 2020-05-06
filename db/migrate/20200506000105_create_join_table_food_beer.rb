class CreateJoinTableFoodBeer < ActiveRecord::Migration[6.0]
  def change
   
    create_join_table :food_pairings, :beers, column_options: { null: false, foreign_key: true } do |t|
      t.index [:food_pairing_id, :beer_id]
      t.index [:beer_id, :food_pairing_id]
      
    end
      
  end
end

