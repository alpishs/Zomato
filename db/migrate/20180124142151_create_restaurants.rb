class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisines
      t.integer :cost_for_two

      t.timestamps
    end
  end
end
