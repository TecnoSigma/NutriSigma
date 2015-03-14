require 'rails_helper'

RSpec.describe Patient, :type => :model do
  let(:valid_patient) {{patient_id: 00000000, name:"paciente", email:"paciente@patient.com", gender:"Masculino", age:30, height: 1.8, weight: 80}}
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

  describe "Validates formulas" do

    it "Ideal Weight (gender: Famale)" do
      p = Patient.new(valid_patient)
      iw = 21 * (p.height ** 2).round(2)
      expect(iw).to eq (68.04)
    end

    it "Ideal Weight (gender: Male)" do
      p = Patient.new(valid_patient)
      iw = 22 * (p.height ** 2).round(2)
      expect(iw).to eq (71.28)
    end

    it "Amount to lose (weight)" do
      p = Patient.new(valid_patient)
      amount = (p.weight * 0.05).round(0)
      expect(amount).to eq (4)
    end


    it "IMC" do
      p = Patient.new(valid_patient)
      imc = (p.weight / (p.height ** 2)).round(2)
      expect(imc).to eq (24.69)
    end

    describe "Type of the IMC" do

      it "Obesity III (morbid)" do
        p = Patient.new(valid_patient)
        p.weight = 250
        imc = (p.weight / (p.height ** 2)).round(1)
        expect(imc).to be > (45)
      end

      it "Obesity II (severe)" do
        p = Patient.new(valid_patient)
        p.weight = 130
        imc = (p.weight / (p.height ** 2)).round(1)
        expect(imc).to be > (40)
        expect(imc).to be <= (45)
      end

      it "Obesity I" do
        p = Patient.new(valid_patient)
        p.weight = 100
        imc = (p.weight / (p.height ** 2)).round(1)
        expect(imc).to be > (30)
        expect(imc).to be <= (40)
      end

      it "Overweight" do
        p = Patient.new(valid_patient)
        p.weight = 90
        imc = (p.weight / (p.height ** 2)).round(1)
        expect(imc).to be > (25)
        expect(imc).to be <= (30)
      end

      it "Normal Weight" do
        p = Patient.new(valid_patient)
        p.weight = 80
        imc = (p.weight / (p.height ** 2)).round(1)
        expect(imc).to be > (18.5)
        expect(imc).to be <= (25)
      end      

      it "Under Weight" do
        p = Patient.new(valid_patient)
        p.weight = 60
        imc = (p.weight / (p.height ** 2)).round(1)
        expect(imc).to be <= (18.5)
      end    

    end

  end
end