require 'rails_helper'

RSpec.describe AnamnesisFoodItem, :type => :model do
  let(:valid_food_item) {{equivalent_food_id: 1, quantity: 100, meal_time:"manha"}}
  describe "Validates presence" do
    it "Should save a valid anamnesis food item" do
      @anamnesis_food_item = AnamnesisFoodItem.new(valid_food_item)
      expect(@anamnesis_food_item.valid?).to eq(true)
    end
    it "Should not save an invalid anamnesis food item" do
      @anamnesis_food_item = AnamnesisFoodItem.new
      expect(@anamnesis_food_item.valid?).to eq(false) 
    end
  end
end