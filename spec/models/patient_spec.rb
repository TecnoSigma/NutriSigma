require 'rails_helper'

RSpec.describe Patient, :type => :model do
  let(:valid_patient) {{patient_id: 00000000, name:"paciente", email:"paciente@patient.com", gender:"Masculino", age:30, height: 3.42, weight: 80}}
  describe "Validates presence" do
    it "Should save a valid patient" do
      @patient = Patient.new(valid_patient)
      expect(@patient.valid?).to eq(true)
    end
    it "Should NOT save an invalid patient" do
      @patient = Patient.new
      expect(@patient.valid?).to eq(false)
    end
  end
end