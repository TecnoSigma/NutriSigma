require 'rails_helper'

RSpec.describe NutritionistProfile, :type => :model do
  let(:profile) {{name: "Maria da Silva",
                  email: "maria.silva@nutri.com.br",
                  issuing_institution: "CRN-3",
                  crn_number: "0244",
                  crn_expiration: "2018-11-05",
                  license_type: "Definitiva"}}

  describe "Validate Nutritionist Profile" do

    it "validate creation nutritionist profile" do
      n = NutritionistProfile.create(profile)
      expect(n.persisted?).to be true
    end

    it "validate creation nutritionist profile (empty)" do
      n = NutritionistProfile.create
      expect(n.persisted?).to be false
    end

    it "validate creation of the Nutritionist Profile (field name is empty)" do
      n = NutritionistProfile.new(profile)
      n.name = nil
      expect(n.persisted?).to be false
    end

    it "validate creation of the Nutritionist Profile (field email is empty)" do
      n = NutritionistProfile.new(profile)
      n.email = nil
      expect(n.persisted?).to be false
    end

    it "validate creation of the Nutritionist Profile (field issuing_institution is empty)" do
      n = NutritionistProfile.new(profile)
      n.issuing_institution = nil
      expect(n.persisted?).to be false
    end

    it "validate creation of the Nutritionist Profile (field issuing_institution is empty)" do
      n = NutritionistProfile.new(profile)
      n.issuing_institution = nil
      expect(n.persisted?).to be false
    end

    it "validate creation of the Nutritionist Profile (field crn_number is empty)" do
      n = NutritionistProfile.new(profile)
      n.crn_number = nil
      expect(n.persisted?).to be false
    end

    it "validate creation of the Nutritionist Profile (field crn_expiration is empty)" do
      n = NutritionistProfile.new(profile)
      n.crn_expiration = nil
      expect(n.persisted?).to be false
    end

    it "validate creation of the Nutritionist Profile (field license_type is empty)" do
      n = NutritionistProfile.new(profile)
      n.license_type = nil
      expect(n.persisted?).to be false
    end

    describe "validates license_type" do

      it "validate creation of the Nutritionist Profile (field license_type is valid using the option 'Definitiva')" do
        n = NutritionistProfile.new(profile)
        n.license_type = "Definitiva"
        expect(n.valid?).to be true
      end

    end

  end

end
