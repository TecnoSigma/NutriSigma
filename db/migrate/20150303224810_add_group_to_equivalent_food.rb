class AddGroupToEquivalentFood < ActiveRecord::Migration
  def change
    add_column :equivalent_foods, :group, :integer
  end
end
