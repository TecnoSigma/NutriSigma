class AddNutritionistRefToNutritionistProfiles < ActiveRecord::Migration
  def change
    add_reference :nutritionist_profiles, :nutritionist, index: true
    add_foreign_key :nutritionist_profiles, :nutritionists
  end
end
