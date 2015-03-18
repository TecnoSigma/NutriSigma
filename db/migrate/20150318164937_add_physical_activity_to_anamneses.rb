class AddPhysicalActivityToAnamneses < ActiveRecord::Migration
  def change
    add_column :anamneses, :physical_activity, :float
  end
end
