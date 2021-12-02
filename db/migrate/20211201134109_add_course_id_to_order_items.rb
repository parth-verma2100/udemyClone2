class AddCourseIdToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :course_id, :integer
  end
end
