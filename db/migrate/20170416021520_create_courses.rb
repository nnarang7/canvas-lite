class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :professor
      t.string :location
      t.string :weekdays
      t.time :starting_time
      t.time :ending_time

      t.timestamps null: false
    end
  end
end
