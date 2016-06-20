class Assignment < ActiveRecord::Base
    has_many :posts
    has_many :positions
    accepts_nested_attributes_for :positions, allow_destroy: true
    has_many :notes
    has_many :comment_forms
    accepts_nested_attributes_for :comment_forms
    
   # finds the number of two-group assignments that preceded the current assignment
   # is used to index into a User's :assigned_groups string to find which group
   # they were assigned to for the given assignment
    def twoGroupCount(assignment)
      @twoGroupCount = 0
      Assignment.where(is2group: true).each do |a|
      	if a.id <= assignment.id
          @twoGroupCount += 1
      	end
      end
      return @twoGroupCount
  	end
    
end
