class AnamnesisFoodItem < ActiveRecord::Base
  belongs_to :anamnesis
  belongs_to :equivalent_food
end