require 'rails_helper'

RSpec.describe EquivalentFood, :type => :model do
  describe "validate creation of the registers" do
    
    it "validate creation of the food group" do
      grupo = GroupFood.create!(group: "Sementes")
      expect(grupo.persisted?).to be true
    end



  end

end
