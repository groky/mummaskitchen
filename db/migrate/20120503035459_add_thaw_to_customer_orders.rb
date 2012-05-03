class AddThawToCustomerOrders < ActiveRecord::Migration
  def self.up
    add_column :customer_orders, :thaw , :boolean, :default=>false
  end

  def self.down
    drop_column :customer_orders, :thaw
  end
end
