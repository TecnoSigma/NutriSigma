class CreateFoodGroups < ActiveRecord::Migration
  def change
    create_table :food_groups do |t|
      t.string :group
      t.float :carbohydrate
      t.float :proteins
      t.float :lipids
      t.float :kilocalories
      t.timestamps null: false
    end
  end
end