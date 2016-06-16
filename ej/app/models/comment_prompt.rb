class CommentPrompt < ActiveRecord::Base
	belongs_to :comment_form
	has_many :comment_answers
end
