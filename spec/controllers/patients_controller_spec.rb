require 'rails_helper'

RSpec.describe PatientsController, :type => :controller do
  let(:all_params) {{patient_id: 00000000, name:"paciente2", email:"pacient3@patient.com", gender:"Masculino", age:30, height: 3.42, weight: 80,medical_register_id: 00000000, morning_meal_time: Time.new, noon_meal_time: (Time.new + 1.hour), evening_meal_time: (Time.new + 6.hour)}}
  before do
    10.times do
      @a_patient = Patient.create(patient_id: 00000000, name:"paciente", email:"paciente@patient.com", gender:"Masculino", age:30, height: 3.42, weight: 80 )
    end
  end
  describe "GET action" do
    it "#index" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "#show" do
      get :show, id: 10
      expect(assigns(:patient)).to eq(@a_patient)
    end
    it "#new" do
      new_patient = Patient.new
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
      post :create, patient: all_params
      expect(Patient.last.name).to eq("paciente2")
    end
    it "#update" do 
      post :update, id: 10, patient:{name:"pacient3"}
      expect(Patient.find(10).name).to eq("pacient3")
    end
  end
  describe "DELETE action" do
    it "#destroy" do
      last_id = Patient.last.id
      delete :destroy, id: last_id
      expect{Patient.find(last_id)}.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end