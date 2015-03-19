class AddNutritionistRefToPatients < ActiveRecord::Migration
  def change
    add_reference :patients, :nutritionist, index: true
    add_foreign_key :patients, :nutritionists
  end
end
