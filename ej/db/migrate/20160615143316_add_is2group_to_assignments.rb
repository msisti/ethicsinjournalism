class AddIs2groupToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :is2group, :boolean
  end
end
