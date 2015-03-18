require 'rails_helper'

RSpec.describe AnamnesesController, :type => :controller do
  let(:anamnesis_params) {{medical_register_id: 00000001, morning_meal_time: Time.new, noon_meal_time: (Time.new + 1.hour), evening_meal_time: (Time.new + 6.hour), patient_id: 1 }}
  before do 
    10.times do 
      @a_anamnesis = Anamnesis.create(medical_register_id: 00000000, morning_meal_time: Time.new, noon_meal_time: (Time.new + 1.hour), evening_meal_time: (Time.new + 6.hour), patient_id: 1 )
    end
  end
  describe "GET action" do
    it "#index" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "#show" do
      get :show, id: 10
      expect(assigns(:anamnesis)).to eq(@a_anamnesis)
    end
    it "#new" do
      new_anamnesis = Anamnesis.new
      get :new
      expect(response).to render_template(:new)
    end
    it "#edit" do
      get :edit, id:1
      expect(response).to render_template(:edit)
    end
  end
  describe "POST action" do
    it "#create" do
      post :create, anamnesis: anamnesis_params
      expect(Anamnesis.last.medical_register_id).to eq(00000001)
    end
    it "#update" do 
      post :update, id: 10, anamnesis:{medical_register_id:00000003}
      expect(Anamnesis.find(10).medical_register_id).to eq(00000003)
    end
  end
  describe "DELETE action" do
    it "#destroy" do
      last_id = Anamnesis.last.id
      delete :destroy, id: last_id
      expect{Anamnesis.find(last_id)}.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end