class CommentForm < ActiveRecord::Base
	belongs_to :assignment
	# has_many :comment_prompts
	# accepts_nested_attributes_for :comment_prompts
	has_many :comments

	def self.attributes_to_ignore_when_comparing
    [:id, :created_at, :updated_at]
  end

  def identical?(other)
    self.attributes.except(*self.class.attributes_to_ignore_when_comparing.map(&:to_s)) ==
    other.attributes.except(*self.class.attributes_to_ignore_when_comparing.map(&:to_s))
  end
end
