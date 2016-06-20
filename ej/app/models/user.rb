class User < ActiveRecord::Base
  
  has_many :posts
  has_many :notes
  has_many :comments
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  # assign user to groups for as many assignments exist that have two groups
  def assignToGroups(user, assignment)
  	twoGroupCount = assignment.twoGroupCount(assignment)
  	
  	if user.assigned_groups == nil
      user.assigned_groups = ((user.id.to_i % 2) + 1).to_i
  	end

  	while user.assigned_groups.length < twoGroupCount
  	  if user.assigned_groups[user.assigned_groups.length-1] == "1"
  	  	user.assigned_groups << "2"
      else 
        user.assigned_groups << "1"
      end
    end

  end
         
end
