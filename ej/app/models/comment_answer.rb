class CommentAnswer < ActiveRecord::Base
	belongs_to :comment
	belongs_to :user
	belongs_to :comment_prompt
end
