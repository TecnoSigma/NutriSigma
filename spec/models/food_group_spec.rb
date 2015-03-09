require 'rails_helper'

RSpec.describe FoodGroup, :type => :model do
  let(:food_group)  {{group: "Frutas",
                      carbohydrate: 16,
                      proteins: 0.5,
                      lipids: 0.6,
                      kilocalories: 75.0}}

  describe "validate Food Group" do
    
    it "validate creation of the food group" do
      g = FoodGroup.create(food_group)
      expect(g.persisted?).to be true
    end
    
  end
end
