class EquivalentFood < ActiveRecord::Base
  #validates_presence_of :food, :group, :quantity_measure, :measure, :weight
  #validates_numericality_of :group, only_integer: true
  #validates_numericality_of :quantity_measure, only_float: true
  #validates_numericality_of :weight, only_float: true
  belongs_to :food_group
  has_many :anamnesis_food_items
end