class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :professor
      t.string :location
      t.string :weekdays
      t.time :time

      t.timestamps null: false
    end
  end
end
