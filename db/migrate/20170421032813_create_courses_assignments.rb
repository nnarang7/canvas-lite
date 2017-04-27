class CreateCoursesAssignments < ActiveRecord::Migration
  def change
    create_table :courses_assignments do |t|
      t.integer :course_id
      t.integer :assignment_id

      t.timestamps null: false
    end
  end
end
