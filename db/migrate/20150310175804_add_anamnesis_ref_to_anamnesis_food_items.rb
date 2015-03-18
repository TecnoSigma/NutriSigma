class AddAnamnesisRefToAnamnesisFoodItems < ActiveRecord::Migration
  def change
    add_reference :anamnesis_food_items, :anamnesis, index: true
    add_foreign_key :anamnesis_food_items, :anamneses
  end
end
