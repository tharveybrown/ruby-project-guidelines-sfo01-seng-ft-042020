class AddTaglineColumnToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :tagline, :string
  end
end
