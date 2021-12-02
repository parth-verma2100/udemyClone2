class AddTotalToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :total, :decimal
  end
end
