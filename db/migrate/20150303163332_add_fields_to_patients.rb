class AddFieldsToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :patient_id, :integer
    add_column :patients, :name, :string
    add_column :patients, :email, :string
    add_column :patients, :gender, :string
    add_column :patients, :age, :integer
    add_column :patients, :height, :float
    add_column :patients, :weight, :float
  end
end
