class CreateEquivalentFoods < ActiveRecord::Migration
  def change
    create_table :equivalent_foods do |t|
      t.string :food
      t.integer :quantity_measure
      t.string :measure
      t.integer :weight

      t.timestamps null: false
    end
  end
end
