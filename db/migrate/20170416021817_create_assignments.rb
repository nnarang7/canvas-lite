class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :description
      t.string :type
      t.float :score
      t.float :out_of
      t.string :course_id
      t.datetime :due

      t.timestamps null: false
    end
  end
end
