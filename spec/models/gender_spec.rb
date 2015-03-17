require 'rails_helper'

describe Gender do
  describe "#description" do
    it "should be masculino when M" do
      gender = Gender.from_letter('M')
      expect(gender.description).to eq "masculino"
    end
    it "should be feminino when F" do
      gender = Gender.from_letter('F')
      expect(gender.description).to eq "feminino"
    end
    it "should raise an exception when different F and M" do
      gender = Gender.from_letter('Z')
      expect{
        gender.description
      }.to raise_exception
    end
  end

  describe "#from_description" do
    it "should be M when masculino" do
      g = Gender.from_description("masculino")
      expect(g.letter).to eq 'M'
    end
    it "should be F when masculino" do
      g = Gender.from_description("feminino")
      expect(g.letter).to eq 'F'
    end
  end

  describe "#==" do
    it "should be true" do
      g = Gender.from_letter("M")
      expect(g == 'M').to eq true
    end
    it "should be true when F" do
      g = Gender.from_letter("F")
      expect(g == 'F').to eq true
    end

    it "should raise an exception when not a gender or valid letter" do
      g = Gender.from_letter("M")
      expect{
        g == 'Z'
      }.to raise_exception

      expect{
        g == Object.new
      }.to raise_exception
    end

    it "should be true when a gender" do
      g = Gender.from_letter("F")
      g2 = Gender.from_letter("F")
      expect(g == g2).to eq true
    end
  end

  describe "#letter" do
    it "should be F" do
      gender = Gender.from_letter('F')
      expect(gender.letter).to eq 'F'
    end
    it "should be M" do
      gender = Gender.from_letter('M')
      expect(gender.letter).to eq 'M'
    end
  end
end
