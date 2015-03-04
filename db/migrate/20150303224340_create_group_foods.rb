class CreateGroupFoods < ActiveRecord::Migration
  def change
    create_table :group_foods do |t|
      t.string :group

      t.timestamps null: false
    end
  end
end
