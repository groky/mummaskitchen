class CreateCustomerOrders < ActiveRecord::Migration
  def self.up
    create_table :customer_orders do |t|
      t.integer :customer_id
      t.integer :dish_id
      t.integer :price_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :customer_orders
  end
end
