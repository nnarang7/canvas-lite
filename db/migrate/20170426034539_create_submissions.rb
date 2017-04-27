class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :name
      t.string :attachment
      t.integer :user_id
      t.integer :assignment_id
      t.float :score

      t.timestamps null: false
    end
  end
end
