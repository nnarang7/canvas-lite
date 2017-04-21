class Assignment < ActiveRecord::Base
	has_many :CoursesAssignments
	has_many :courses, through: :CoursesAssignments
end
