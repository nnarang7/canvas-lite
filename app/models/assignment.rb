class Assignment < ActiveRecord::Base
  validates :name, presence: true
  validates :course_id, presence: true
  validates :name, length: { minimum: 2 }
  validates :description, presence: true
  validates :out_of, presence: true
  has_many :CoursesAssignments
  has_many :courses, through: :CoursesAssignments
end
