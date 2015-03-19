class AnamnesisFoodItem < ActiveRecord::Base
  belongs_to :anamnesis
  belongs_to :equivalent_food
  validates :equivalent_food_id, :quantity, :meal_time,presence:true
end