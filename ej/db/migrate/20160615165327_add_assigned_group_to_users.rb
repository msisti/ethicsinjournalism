class AddAssignedGroupToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :assigned_groups, :string
  end
end
