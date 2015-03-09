class AddFoodGroupRefToEquivalentFoods < ActiveRecord::Migration
  def change
    add_reference :equivalent_foods, :food_group, index: true
    add_foreign_key :equivalent_foods, :food_groups
  end
end
