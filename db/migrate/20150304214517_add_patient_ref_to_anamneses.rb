class AddPatientRefToAnamneses < ActiveRecord::Migration
  def change
    add_reference :anamneses, :patient, index: true
    add_foreign_key :anamneses, :patients
  end
end
