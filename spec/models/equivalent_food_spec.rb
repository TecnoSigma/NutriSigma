require 'rails_helper'

RSpec.describe EquivalentFood, :type => :model do
  describe "validate creation of the registers" do
    
    it "validate creation of the food group" do
      g = GroupFood.create(group: "Sementes")
      expect(g.persisted?).to be true
    end

    it "validate creation of the food group (empty)" do
      g = GroupFood.create
      expect(g.persisted?).to be false
    end

    it "validate creation of the Equivalent Food (empty)" do
      f = EquivalentFood.create
      expect(f.persisted?).to be false
    end

  end

end
