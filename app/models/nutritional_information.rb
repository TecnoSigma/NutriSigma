class NutritionalInformation

  #Total Energy Expenditure
  def self.tee(age, phisical_activity, weight, height, kcal)
    tee = (1086 - (10.1 * age) + phisical_activity * (13.7 * weight) + (416 * height) - kcal).round(2)
  end
end
