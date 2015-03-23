require 'rails_helper'

RSpec.describe NutritionistProfilesController, :type => :controller do
  let(:profile) {{name: "Maria da Silva",
                  email: "maria.silva@nutri.com.br",
                  issuing_institution: "CRN-3",
                  crn_number: "0244",
                  crn_expiration: "2018-11-05",
                  license_type: "Definitiva"}}

  before do
    5.times do
      @nutritionist_profile = NutritionistProfile.create(name: "Nutricionista-Padrão",
                                                         email: "padrao@nutri.com.br",
                                                         issuing_institution: "CRN-10",
                                                         crn_number: "0999",
                                                         crn_expiration: "2018-11-05",
                                                         license_type: "Definitiva")
    end
    nutritionist = Nutritionist.create!(email: "teste@teste.com", password: 12345678)
    sign_in nutritionist
  end

  describe "GET action" do
    before do
      @nutritionist_profile = NutritionistProfile.create(name: "Nutricionista-Padrão",
                                                         email: "padrao@nutri.com.br",
                                                         issuing_institution: "CRN-10",
                                                         crn_number: "0999",
                                                         crn_expiration: "2018-11-05",
                                                         license_type: "Definitiva")
    end
    it "validate #index" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "validate #edit" do
      get :edit, id: @nutritionist_profile.id
      expect(response).to render_template(:edit)
    end

    it "validate #show" do
      get :show, id: @nutritionist_profile.id
      expect(assigns(:nutri_profile)).to eq(@nutritionist_profile)
    end

    it "validate #new" do
      nutritionist_profile = NutritionistProfile.new
      get :new
      expect(response).to render_template(:new)
    end

  end

  describe "DELETE action" do

    it "validate #destroy" do
      last_id = NutritionistProfile.last.id
      delete :destroy, id: last_id
      expect{NutritionistProfile.find(last_id)}.to raise_exception(ActiveRecord::RecordNotFound)
    end

  end

  describe "POST action" do
    it "validate #create" do
      post :create, nutritionist_profile: profile
      expect(NutritionistProfile.last.name).to eq("Maria da Silva")
    end
    it "#update" do
      post :update, id:NutritionistProfile.last.id ,nutritionist_profile:{name:"Jose da Silva"}
      expect(NutritionistProfile.last.name).to eq("Jose da Silva")
    end

  end

end
