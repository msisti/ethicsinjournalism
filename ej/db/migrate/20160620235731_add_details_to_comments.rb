class AddDetailsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :answer1, :text
    add_column :comments, :answer2, :text
    add_column :comments, :answer3, :text
    add_column :comments, :answer4, :text
  end
end
