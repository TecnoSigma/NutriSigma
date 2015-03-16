require 'rails_helper'

RSpec.describe NutritionalInformation, :type => :model do
    let(:valid_patient) {{name:"paciente",
                          email:"paciente@patient.com",
                          gender:"Masculino", 
                          age:30, 
                          height: 1.8, 
                          weight: 80}}

    before do
      p = Patient.new(valid_patient)
      @kcal = 1026
      @af = 1.12
      @tee = (1086 - (10.1 * p.age) + @af * (13.7 * p.weight) + (416 * p.height) - @kcal).round(2)
    end

    describe "validate the nutricional information" do
      it "validate the TEE (Total Energy Expenditure)" do
        p = Patient.new(valid_patient)
        tee = (1086 - (10.1 * p.age) + @af * (13.7 * p.weight) + (416 * p.height) - @kcal).round(2)
        expect(tee).to eq (1733.32)
      end

        it "validate the PTN (Protein)" do
          p = Patient.new(valid_patient)
          ptn = 0.8 * p.weight
          expect(ptn).to eq (64.0)
        end

        it "validate % PTN (Percent of the Protein)" do
          pptn = (@kcal * 100 / @tee).round(2)
          expect(pptn).to eq (59.19)
        end

        it "validate RES. PTN (Residual of the Protein)" do
          rptn = (@tee * 0.15).round(2)
          expect(rptn).to eq (260.0)
        end

        it "validate CHO (carbohydrate)" do
          cho = (@tee * 0.60).round(2)
          expect(cho).to eq (1039.99)
        end

        it "validate LIP (lipids)" do
          lip = (@tee * 0.25).round(2)
          expect(lip).to eq (433.33)
        end
    end
end
