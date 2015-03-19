class AddFieldsToAnamneses < ActiveRecord::Migration
  def change
    add_column :anamneses, :medical_register_id, :integer
    add_column :anamneses, :morning_meal_time, :time
    add_column :anamneses, :noon_meal_time, :time
    add_column :anamneses, :evening_meal_time, :time
  end
end
