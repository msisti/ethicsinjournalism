class CreateCommentAnswers < ActiveRecord::Migration
  def change
    create_table :comment_answers do |t|
      t.text :content
      t.integer :user_id
      t.integer :comment_id
      t.integer :comment_prompt_id

      t.timestamps null: false
    end
  end
end
