class Patient < ActiveRecord::Base
	validates :patient_id, :name, :email, :gender, :age, :height, :weight, presence: true

  MASCULINO = Gender.from_letter("M")
  FEMININO = Gender.from_letter("F")

  def gender
    unless attributes["gender"].nil?
      Gender.from_letter(attributes["gender"][0])
    end
  end

  def calc_imc
    (weight / (height ** 2)).round(2)
  end 

  def type_imc
    if calc_imc > 45
      "Obesidade III (Mórbida)"
    elsif calc_imc < 40 || calc_imc <= 45
      "Obesidade II (Severa)"
    elsif calc_imc > 30 || calc_imc <= 40
      "Obesidade I"
    elsif calc_imc > 25 || calc_imc <= 30
      "Sobre Peso"
    elsif calc_imc > 18.5 || calc_imc <= 25
      "Peso Normal"
    elsif calc_imc <= 18.5
      "Abaixo do Peso" 
    end
  end

  def calc_ideal_weight
    if gender == FEMININO
      21 * (height ** 2).round(2)
    elsif gender == MASCULINO
      22 * (height ** 2).round(2)
    end
  end

  def calc_amount_lose
    (weight * 0.05).round(0)
  end

  def calc_calories(tax)
    if gender == "masculino"
      (tax * (66 + (13.7 * weight) + (5 * height * 100) - (6.8 * age))).round(2)
    elsif gender == "feminino"
      (tax * (655 + (9.6 * p.weight) + (1.8 * p.height * 100) - (4.7 * p.age))).round(2)
    end
  end

end
