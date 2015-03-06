class CreateEquivalentFoods < ActiveRecord::Migration
  def change
    create_table :equivalent_foods do |t|
      t.string :food
      t.integer :group
      t.float :quantity_measure
      t.string :measure
      t.float :weight

      t.timestamps null: false
    end
  end
end
