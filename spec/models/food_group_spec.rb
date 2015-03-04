require 'rails_helper'

RSpec.describe FoodGroup, :type => :model do
  describe "validate Food Group" do
    
    it "validate creation of the food group" do
      g = FoodGroup.create(group: "Sementes")
      expect(g.persisted?).to be true
    end

    it "validate creation of the food group (empty)" do
      g = FoodGroup.create
      expect(g.persisted?).to be false
    end
    
  end
end
