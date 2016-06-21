class CommentForm < ActiveRecord::Base
	belongs_to :assignment
	# has_many :comment_prompts
	# accepts_nested_attributes_for :comment_prompts
	has_many :comments
end
