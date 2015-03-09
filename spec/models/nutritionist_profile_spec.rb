require 'rails_helper'

RSpec.describe NutritionistProfile, :type => :model do
  let(:profile) {{name: "Maria da Silva",
                  email: "maria.silva@nutri.com.br",
                  issuing_institution: "CRN-3",
                  crn_number: "0244",
                  expiration_crn: "2018-11-05",
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

  end

end
