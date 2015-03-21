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
    (0.8 * weight).round(2)
  end

  #% PTN (Percent of the Protein)
  def self.percent_ptn(kcal, tee)
    (kcal * 100 / tee).round(2)
  end

  #CHO (carbohydrate)
  def self.cho(tee)
    (tee * 0.60).round(2)
  end

  #RES. PTN (Residual of the Protein)
  def self.res_ptn(tee)
    (tee * 0.15).round(2)
  end

  #LIP (lipids)
  def self.lip(tee)
    (tee * 0.25).round(2)
  end

  def self.demand_portion(group_name, kcal_patient)
    groups = FoodGroup.all.select{ |g| g.group == group_name}
    @gr = groups[0]
    @kcal_patient = kcal_patient
    generate_portion(@gr["kilocalories"])
  end

  private
  def self.generate_portion(field_number) 
    portion = (@kcal_patient / field_number).round(2)
  end

end
