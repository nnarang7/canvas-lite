class Course < ActiveRecord::Base
	has_many :CoursesAssignments
	has_many :CoursesUsers	
	has_many :assignments, through: :CoursesAssignments, dependent: :destroy
	has_many :users, through: :CoursesUsers
end
