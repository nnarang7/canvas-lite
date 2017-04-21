require 'bcrypt'

class User < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name, length: { minimum: 2 }
	validates :email, presence: true
	validates :password, presence: true
	has_many :courses
	has_many :assignments
	has_many :CoursesAssignments

	include BCrypt

	def password
		@password ||= Password.new(password_hash) unless password_hash.nil?
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end
end
