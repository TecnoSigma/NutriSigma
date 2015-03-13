class Patient < ActiveRecord::Base
	validates :patient_id, :name, :email, :gender, :age, :height, :weight, presence: true

  def calc_imc
    (weight / (height * height)).round(2)
  end

end
