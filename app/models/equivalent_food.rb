class EquivalentFood < ActiveRecord::Base
  validates_presence_of :food, :group, :quantity_measure, :measure, :weight
end
