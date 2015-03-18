require 'rails_helper'

RSpec.describe NutritionalInformation, :type => :model do
    let(:valid_patient) {{name:"paciente",
                          email:"paciente@patient.com",
                          gender:"Masculino", 
                          age:30, 
                          height: 1.8, 
                          weight: 80}}

    before do
      phisical_activity = 1.12
      @kcal = 1026
      @tee = NutritionalInformation.tee(subject.age, phisical_activity, subject.weight, subject.height, @kcal)
    end

    describe NutritionalInformation do
      subject{ Patient.new(valid_patient) }

      it "validate the TEE (Total Energy Expenditure)" do
        expect(@tee).to eq (1733.32)
      end

      it "validate the PTN (Protein)" do
        expect(NutritionalInformation.ptn(subject.weight)).to eq (64.0)
      end

      it "validate % PTN (Percent of the Protein)" do
        expect(NutritionalInformation.percent_ptn(@kcal,@tee)).to eq (59.19)
      end

    end
end
