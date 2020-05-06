class CreateFoodPairings < ActiveRecord::Migration[6.0]
  def change
    create_table :food_pairings do |t|
      t.string :food
    end
  end
end
