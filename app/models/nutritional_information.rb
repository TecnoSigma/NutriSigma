class NutritionalInformation
  #attr_reader :patient

  #def initialize(patient)
  #  @patient = patient
  #end

#def tee
#  (1086 - (10.1 * age) + phisical_activity * (13.7 * weight) + (416 * height) - kcal).round(2)
#end

#def ptn
  #0.8 * patient.weight 
#end


  #Total Energy Expenditure
  def self.tee(age, phisical_activity, weight, height, kcal)
    (1086 - (10.1 * age) + phisical_activity * (13.7 * weight) + (416 * height) - kcal).round(2)
  end

  #PTN (Protein)
  def self.ptn(weight)
    0.8 * weight      
  end

  #% PTN (Percent of the Protein)
  def self.percent_ptn(kcal, tee)
    (kcal * 100 / tee).round(2)
  end

  #RES. PTN (Residual of the Protein)
  def self.res_ptn(tee)
    (tee * 0.15).round(2)
  end


end
