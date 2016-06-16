class Assignment < ActiveRecord::Base
    has_many :posts
    has_many :positions
    accepts_nested_attributes_for :positions, allow_destroy: true
    has_many :notes
    has_many :comment_forms
    accepts_nested_attributes_for :comment_forms
    
end
