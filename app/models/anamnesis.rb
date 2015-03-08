class Anamnesis < ActiveRecord::Base
  validates :medical_register_id, :morning_meal_time, :noon_meal_time, :evening_meal_time, :patient_id, presence:true
  belongs_to :patient, dependent: :destroy
end
