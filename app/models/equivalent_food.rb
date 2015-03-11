class EquivalentFood < ActiveRecord::Base
  validates_presence_of :food, :quantity_measure, :measure, :weight
  validates_numericality_of :quantity_measure, only_float: true
  validates_numericality_of :weight, only_float: true
  belongs_to :food_group
end