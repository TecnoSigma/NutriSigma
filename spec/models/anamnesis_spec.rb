require 'rails_helper'

RSpec.describe Anamnesis, :type => :model do
  let(:valid_anamnesis) {{medical_register_id: 00000000, morning_meal_time: Time.new, noon_meal_time: (Time.new + 1.hour), evening_meal_time: (Time.new + 6.hour),physical_activity:1.5, patient_id: 1 }}
  describe "Validates presence" do
    it "Should save a valid anamnesis" do
      @anamnesis = Anamnesis.create(valid_anamnesis)
      expect(@anamnesis.persisted?).to eq(true)
    end
    it "Should NOT save an invalid anamnesis" do
      @anamnesis = Anamnesis.create
      expect(@anamnesis.persisted?).to eq(false)
    end
  end
end