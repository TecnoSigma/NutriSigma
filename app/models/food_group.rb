class FoodGroup < ActiveRecord::Base
  validates_presence_of :group, :carbohydrate, :proteins, :lipids, :kilocalories
  validates_numericality_of :carbohydrate, only_float: true
  validates_numericality_of :proteins, only_float: true
  validates_numericality_of :lipids, only_float: true
  validates_numericality_of :kilocalories, only_float: true
end
