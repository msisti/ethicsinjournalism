class AddCommentDeadlineToAssignments < ActiveRecord::Migration
  def change
  	# add_column table_name, :column_name, :column_type
    add_column :assignments, :comment_deadline, :datetime
  end
end
