require 'rails_helper'

RSpec.describe NutritionistProfilesController, :type => :controller do
  let(:profile) {{name: "Maria da Silva",
                  email: "maria.silva@nutri.com.br",
                  issuing_institution: "CRN-3",
                  crn_number: "0244",
                  crn_expiration: "2018-11-05",
                  license_type: "Definitiva"}}

  describe "GET action" do

    it "validate #index" do
      get :index
      expect(response).to have_http_status(:success)
    end

  end

end
