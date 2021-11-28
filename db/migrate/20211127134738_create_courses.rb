class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.integer :total_videos
      t.string :duration
      t.integer :cost
      t.string :description
      t.string :category
      t.integer :student_count
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
