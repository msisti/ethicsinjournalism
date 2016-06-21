class AddDetailsToCommentForms < ActiveRecord::Migration
  def change
    add_column :comment_forms, :question1, :string
    add_column :comment_forms, :question2, :string
    add_column :comment_forms, :question3, :string
    add_column :comment_forms, :question4, :string
    add_column :comment_forms, :hint1, :string
    add_column :comment_forms, :hint2, :string
    add_column :comment_forms, :hint3, :string
    add_column :comment_forms, :hint4, :string
  end
end
