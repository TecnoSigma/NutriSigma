require 'rails_helper'

RSpec.describe EquivalentFood, :type => :model do
  let(:food) {{food: "Cenoura cozida",
               food_group_id: 2,
               quantity_measure: 4,
               measure: "colheres de sopa",
               weight: 100}}

  describe "validate Equivalent Group" do
  
    it "validate creation of the Equivalent Food" do
      f = EquivalentFood.create(food)
      expect(f.persisted?).to be true
    end

    it "validate creation of the Equivalent Food (all empty fields)" do
      f = EquivalentFood.create
      expect(f.persisted?).to be false
    end

    it "validate creation of the Equivalent Food (field food is empty)" do
      f = EquivalentFood.new(food)
      f.food = nil
      f.save
      expect(f.persisted?).to be false
    end

    it "validate creation of the Equivalent Food (field quantity measure is empty)" do
      f = EquivalentFood.new(food)
      f.quantity_measure = nil
      f.save
      expect(f.persisted?).to be false
    end

    it "validate creation of the Equivalent Food (field measureis is empty)" do
      f = EquivalentFood.new(food)
      f.measure = nil
      f.save
      expect(f.persisted?).to be false
    end

    it "validate creation of the Equivalent Food (field food is empty)" do
      f = EquivalentFood.new(food)
      f.food = nil
      f.save
      expect(f.persisted?).to be false
    end

    it "validate creation of the Equivalent Food (field weight is empty)" do
      f = EquivalentFood.new(food)
      f.weight = nil
      f.save
      expect(f.persisted?).to be false
    end

  end
end


