require 'rails_helper'

RSpec.describe Patient, :type => :model do
  let(:valid_patient)  {{patient_id: 00000000,
                         name:"paciente", 
                         email:"paciente@patient.com", 
                         gender:"masculino", 
                         age:30, 
                         height: 1.8, 
                         weight: 80}}

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

    subject{ Patient.new(valid_patient) }

    it "Ideal Weight (gender: Female)" do
      subject.gender = "feminino"
      expect(subject.calc_ideal_weight).to eq (68.04)
    end

    it "Ideal Weight (gender: Male)" do
      expect(subject.calc_ideal_weight).to eq (71.28)
    end

    it "Amount to lose (weight)" do
      expect(subject.calc_amount_lose).to eq (4)
    end

    describe "Validate daily calories" do

      it "Validate daily calories (gender: Male)" do
        expect(subject.calc_calories(1.22)).to eq (2266.76)
      end

      it "Validate daily calories (gender: Female)" do
        subject.gender = "feminino"
        expect(subject.calc_calories(1.22)).to eq (1959.32)
      end

    end

    it "IMC" do
      expect(subject.imc).to eq (24.69)
    end


    describe "Type of the IMC" do

      it "has Obesity III (morbid)" do
        subject.weight = 250
        expect(subject.imc).to be > 45
        expect(subject.type_imc).to eq ("Obesidade III (Mórbida)")
      end

      it "has Obesity II (severe)" do
        subject.weight = 130
        expect(subject.imc).to be_between(40, 45)
        expect(subject.type_imc).to eq ("Obesidade II (Severa)")
      end

    end

  end
end
