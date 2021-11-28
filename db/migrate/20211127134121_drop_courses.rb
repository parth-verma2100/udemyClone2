class DropCourses < ActiveRecord::Migration[6.1]
  def change
    drop_table :courses
  end
end
