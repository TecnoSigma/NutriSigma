require 'rails_helper'

RSpec.describe NutritionalInformation, :type => :model do
  let(:valid_anamnesis) { Anamnesis.new(medical_register_id: 00000000,
                                        morning_meal_time: Time.new,
                                        noon_meal_time: (Time.new + 1.hour),
                                        evening_meal_time: (Time.new + 6.hour),
                                        physical_activity:1.12)}

  let(:valid_patient) {{name:"paciente",
                        email:"paciente@patient.com",
                        gender:"Masculino",
                        age:30,
                        height: 1.8,
                        weight: 80,
                        anamnesis: valid_anamnesis}}

  before do
    @kcal = 1026
    FoodGroup.create!({group: "Frutas",
                      carbohydrate: 16,
                      proteins: 0.5,
                      lipids: 0.6,
                      kilocalories: 75.0})
  end

  subject{ NutritionalInformation.new(patient: Patient.new(valid_patient)) }

  it "validate the TEE (Total Energy Expenditure)" do
    expect(subject.tee(@kcal)).to eq (1733.32)
  end

  it "validate the PTN (Protein)" do
    expect(subject.ptn).to eq (64.0)
  end

  it "validate % PTN (Percent of the Protein)" do
    expect(subject.percent_ptn(@kcal)).to eq (59.19)
  end

  it "validate RES. PTN (Residual of the Protein)" do
    expect(subject.res_ptn(@kcal)).to eq (260.0)
  end

  it "validate CHO (carbohydrate)" do
    expect(subject.cho(@kcal)).to eq (1039.99)
  end

  it "validate LIP (lipids)" do
    expect(subject.lip(@kcal)).to eq (433.33)
  end

  it "get food group portion" do
    expect(subject.demand_portions(@kcal).size).to eq 1
  end
end
