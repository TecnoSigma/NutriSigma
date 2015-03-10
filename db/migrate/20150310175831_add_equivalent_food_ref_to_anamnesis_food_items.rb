class AddEquivalentFoodRefToAnamnesisFoodItems < ActiveRecord::Migration
  def change
    add_reference :anamnesis_food_items, :equivalent_food, index: true
    add_foreign_key :anamnesis_food_items, :equivalent_foods
  end
end
