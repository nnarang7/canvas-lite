# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

canvas_admin = User.create(name: 'Admin', email: 'admin@canvas.edu', password: 'root', is_admin: true)

sample_user = User.create(name: 'user', email: 'user@user.com', password: 'user', is_admin: false)

# CIS371 = Course.create(name: "CIS371", professor: "Benedict Brown", location: "Wu & Chen", tuesday: true, thursday: true)
# CIS196 = Course.create(name: "CIS196", professor: "Justin Kim", location: "Towne 313", monday: true)