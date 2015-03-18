class Gender
  def initialize(letter)
    @gender_letter = letter.upcase
  end
  def self.from_description(description)
    if description.upcase == "MASCULINO"
      Gender.from_letter('M')
    elsif description.upcase == "FEMININO"
      Gender.from_letter('F')
    end
  end
  def self.from_letter(letter)
    Gender.new(letter)
  end

  def letter
    @gender_letter
  end

  def ==(other)
    case other
    when Gender
      other.letter == @gender_letter
    when 'M','F'
      other == @gender_letter
    else
      raise "it's not a valid gender"
    end
  end

  def description
    if @gender_letter == 'M'
      "masculino"
    elsif @gender_letter == 'F'
      "feminino"
    else
      raise "letter is not a valid gender"
    end
  end
end
