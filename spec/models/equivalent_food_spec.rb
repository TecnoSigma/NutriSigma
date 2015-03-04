require 'rails_helper'

RSpec.describe EquivalentFood, :type => :model do
  
  let(:food) {{food: "Cenoura cozida",
               group: 2,
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

  end
end


