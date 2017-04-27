class Course < ActiveRecord::Base
    has_many :CoursesAssignments
    has_many :CoursesUsers
    has_many :assignments, through: :CoursesAssignments, dependent: :destroy
    has_many :users, through: :CoursesUsers
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :name, length: { minimum: 2 }
    validates :professor, presence: true
    validates :professor, length: { minimum: 2 }
end
