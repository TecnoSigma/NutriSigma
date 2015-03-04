class CreateAnamneses < ActiveRecord::Migration
  def change
    create_table :anamneses do |t|

      t.timestamps null: false
    end
  end
end
