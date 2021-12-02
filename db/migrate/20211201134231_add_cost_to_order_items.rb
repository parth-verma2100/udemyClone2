class AddCostToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :cost, :integer
  end
end
