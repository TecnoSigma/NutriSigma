require 'rails_helper'

RSpec.describe NutritionalInformation, :type => :model do
    let(:valid_patient) {{name:"paciente",
                          email:"paciente@patient.com",
                          gender:"Masculino", 
                          age:30, 
                          height: 1.8, 
                          weight: 80}}

    describe NutritionalInformation do
      subject{ Patient.new(valid_patient) }

      it "validate the TEE (Total Energy Expenditure)" do
        phisical_activity = 1.12
        kcal = 1026
        expect(NutritionalInformation.tee(subject.age, phisical_activity, subject.weight, subject.height, kcal)).to eq (1733.32)
      end

    end
end
