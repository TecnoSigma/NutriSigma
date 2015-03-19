class AddFieldsToAnamnesisFoodItems < ActiveRecord::Migration
  def change
    add_column :anamnesis_food_items, :quantity, :float
    add_column :anamnesis_food_items, :meal_time, :string
  end
end
