class DeleteCustomerIdFromCustomerOrderAddOrderId < ActiveRecord::Migration
  def self.up
    rename_column :customer_orders, :customer_id, :order_id
  end

  def self.down
  end
end
