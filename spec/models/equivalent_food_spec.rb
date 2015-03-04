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

    it "validate creation of the Equivalent Food (all empty fields)" do
      f = EquivalentFood.create
      expect(f.persisted?).to be false
    end

    it "validate creation of the Equivalent Food (field empty food)" do
      f = EquivalentFood.new(food)
      f.food = nil
      f.save
      expect(f.persisted?).to be false
    end

    it "validate creation of the Equivalent Food (field empty group)" do
      f = EquivalentFood.new(food)
      f.group = nil
      f.save
      expect(f.persisted?).to be false
    end

    it "validate creation of the Equivalent Food (field empty quantity measure)" do
      f = EquivalentFood.new(food)
      f.quantity_measure = nil
      f.save
      expect(f.persisted?).to be false
    end

    it "validate creation of the Equivalent Food (field empty measure)" do
      f = EquivalentFood.new(food)
      f.measure = nil
      f.save
      expect(f.persisted?).to be false
    end

  end

end
