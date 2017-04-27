class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :description
      t.string :entry_type
      t.float :out_of
      t.integer :course_id
      t.datetime :due

      t.timestamps null: false
    end
  end
end
