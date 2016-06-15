class AddDescription2ToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :description2, :text
  end
end
