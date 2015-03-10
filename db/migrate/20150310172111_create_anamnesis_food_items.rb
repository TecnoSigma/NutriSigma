class CreateAnamnesisFoodItems < ActiveRecord::Migration
  def change
    create_table :anamnesis_food_items do |t|

      t.timestamps null: false
    end
  end
end
