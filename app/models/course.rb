class Course < ActiveRecord::Base
	has_many :CoursesAssignments
	has_many :assignments, through: :CoursesAssignments, dependent: :destroy
end
