class CreateCoursesAssignments < ActiveRecord::Migration
  def change
    create_table :courses_assignments do |t|
      t.string :course_id
      t.string :assignment_id

      t.timestamps null: false
    end
  end
end
