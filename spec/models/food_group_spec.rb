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

    it "validate creation of the food group (empty)" do
      g = FoodGroup.create
      expect(g.persisted?).to be false
    end
    
    it "validate creation of the Food Group (field group is empty)" do
      f = FoodGroup.new(food_group)
      f.group = nil
      f.save
      expect(f.persisted?).to be false
    end

    it "validate creation of the Food Group (field carbohydrate is empty)" do
      f = FoodGroup.new(food_group)
      f.carbohydrate = nil
      f.save
      expect(f.persisted?).to be false
    end

    it "validate creation of the Food Group (field proteins is empty)" do
      f = FoodGroup.new(food_group)
      f.proteins = nil
      f.save
      expect(f.persisted?).to be false
    end

    it "validate creation of the Food Group (field lipids is empty)" do
      f = FoodGroup.new(food_group)
      f.lipids = nil
      f.save
      expect(f.persisted?).to be false
    end

    it "validate creation of the Food Group (field kilocalories is empty)" do
      f = FoodGroup.new(food_group)
      f.kilocalories = nil
      f.save
      expect(f.persisted?).to be false
    end

  end

  describe "generate portions" do
    it "successfully" do
      f = FoodGroup.new(food_group)
      expect(f.generate_portion(75)).to eq 1.00
    end
  end
end
