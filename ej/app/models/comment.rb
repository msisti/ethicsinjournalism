class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :post
    has_many :comment_answers
    accepts_nested_attributes_for :comment_answers
end
