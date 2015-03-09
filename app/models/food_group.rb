class FoodGroup < ActiveRecord::Base
  validates_presence_of :group, :carbohydrate, :proteins, :lipids, :kilocalories
end
