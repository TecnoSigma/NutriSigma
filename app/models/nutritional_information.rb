class NutritionalInformation
  attr_reader :patient

  def initialize(params)
    @patient = params[:patient]
  end

  def tee(kcal)
    (1086 - (10.1 * patient.age) + patient.anamnesis.physical_activity * (13.7 * patient.weight) +
     (416 * patient.height) - kcal).round(2)
  end

  def ptn
    0.8 * patient.weight
  end

  #% PTN (Percent of the Protein)
  def percent_ptn(kcal)
    (kcal * 100 / tee(kcal)).round(2)
  end

  #CHO (carbohydrate)
  def cho(kcal)
    (tee(kcal) * 0.60).round(2)
  end

  #RES. PTN (Residual of the Protein)
  def res_ptn(kcal)
    (tee(kcal) * 0.15).round(2)
  end

  #LIP (lipids)
  def lip(kcal)
    (tee(kcal) * 0.25).round(2)
  end

  def demand_portions(kcal_patient)
    #groups = FoodGroup.all.select{ |g| g.group == group_name}
    groups = FoodGroup.all
    all_potions = {}
    groups.each do |group|
      portion = group.generate_portion(kcal_patient)
      all_potions[group.group] = portion
    end
    all_potions
  end

end
