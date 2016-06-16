class CreateCommentPrompts < ActiveRecord::Migration
  def change
    create_table :comment_prompts do |t|
      t.string :question
      t.string :hint
      t.integer :comment_form_id

      t.timestamps null: false
    end
  end
end
