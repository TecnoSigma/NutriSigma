require 'rails_helper'

RSpec.describe EquivalentFood, :type => :model do
  describe "validate Equivalent Group" do
  
    it "validate creation of the Equivalent Food" do
      f = EquivalentFood.create(food: "Cenoura cozida",
                                group: 2,
                                quantity_measure: 4,
                                measure: "colheres de sopa",
                                weight: 100)
      expect(f.persisted?).to be true
    end

  end
end


