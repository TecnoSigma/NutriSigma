require 'rails_helper'

RSpec.describe Patient, :type => :model do
  let(:valid_patient) {{patient_id: 00000000, name:"paciente", 
                        email:"paciente@patient.com", gender:"masculino", age:30, height: 1.8, weight: 80}}
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
    it "Ideal Weight (gender: Famale)" do
      p = Patient.new(valid_patient.merge(gender:"feminino"))
      expect(p.calc_ideal_weight).to eq (68.04)
    end

    it "Ideal Weight (gender: Famale)" do
      subject.gender="feminino"
      expect(subject.calc_ideal_weight).to eq (68.04)
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

    #it "has Obesity III (morbid)" do
    # p = Patient.new(valid_patient)
    # p.weight = weight_by_type_imc("Obesidade III (Mórbida)")[:weight] 
    # # veja q estou chamando imc e não calc_imc, o imc é o nome adequado para esse metodo
    # expect(p.imc).to be > 45
    # expect(p.type_imc).to be("Obesidade III (Mórbida)")
    #end

    #TYPE_IMC = {"Obesidade III (Mórbida)" => {weight: 250, height: 1.8}}
    #def weight_by_type_imc(type_imc)
    # TYPE_IMC[type_imc]
    #end

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

    it "Validate daily calories" do
      p = Patient.new(valid_patient)
      tax = 1.22

      #Calorias diárias (Homens)
      cal_H = (tax * (66 + (13.7 * p.weight) + (5 * p.height * 100) - (6.8 * p.age))).round(2)
      expect(cal_H).to eq (2266.76)

      #Calorias diárias (Mulheres)
      cal_M = (tax * (655 + (9.6 * p.weight) + (1.8 * p.height * 100) - (4.7 * p.age))).round(2)
      expect(cal_M).to eq (1959.32)
    end

  end
end
