class Patient < ActiveRecord::Base
  validates :patient_id, :name, :email, :gender, :age, :height, :weight, presence: true
  has_one :anamnesis 
end
