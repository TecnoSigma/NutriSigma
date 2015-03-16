class CreateNutritionalInformations < ActiveRecord::Migration
  def change
    create_table :nutritional_informations do |t|
      t.date :date
      t.integer :id_patient
      t.string :name
      t.string :gender
      t.integer :age
      t.string :breakfast
      t.string :lunch
      t.string :dinner
      t.string :nutritionist
      t.string :crn_number
      t.string :issuing_institution

      t.timestamps null: false
    end
  end
end
