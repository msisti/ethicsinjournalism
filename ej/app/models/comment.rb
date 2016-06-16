class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :post
    belongs_to :comment_form
    has_many :comment_answers
    accepts_nested_attributes_for :comment_answers
end
