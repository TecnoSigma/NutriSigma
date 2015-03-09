class CreateNutritionistProfiles < ActiveRecord::Migration
  def change
    create_table :nutritionist_profiles do |t|
      t.string :name
      t.string :email
      t.string :issuing_institution
      t.string :crn_number
      t.date_time :expiration_crn

      t.timestamps null: false
    end
  end
end
