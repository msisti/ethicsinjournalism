class CreateCommentForms < ActiveRecord::Migration
  def change
    create_table :comment_forms do |t|
      t.integer :group_number
      t.string :name
      t.integer :assignment_id
      
      t.timestamps null: false
    end
  end
end
