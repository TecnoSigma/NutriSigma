class Anamnesis < ActiveRecord::Base
  validates :medical_register_id, :morning_meal_time, :noon_meal_time, :evening_meal_time, :patient_id, presence:true
  belongs_to :patient, dependent: :destroy
  has_many :anamnesis_food_items
  def total_carbohydrates(meal_time_field)
    anamnesis_food_items.includes(:equivalent_food).where("meal_time == ?",meal_time_field).reduce(0){ |memo, obj| memo + (obj.equivalent_food.food_group.carbohydrate * obj.quantity)}
  end
  def total_proteins(meal_time_field)
    anamnesis_food_items.includes(:equivalent_food).where("meal_time == ?",meal_time_field).reduce(0){ |memo, obj| memo + (obj.equivalent_food.food_group.proteins * obj.quantity)}
  end
  def total_lipids(meal_time_field)
    anamnesis_food_items.includes(:equivalent_food).where("meal_time == ?",meal_time_field).reduce(0){ |memo, obj| memo + (obj.equivalent_food.food_group.lipids * obj.quantity)}
  end
  def total_kilocalories(meal_time_field)
    anamnesis_food_items.includes(:equivalent_food).where("meal_time == ?",meal_time_field).reduce(0){ |memo, obj| memo + (obj.equivalent_food.food_group.kilocalories * obj.quantity)}
  end
end