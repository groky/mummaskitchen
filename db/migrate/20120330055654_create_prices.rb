class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.integer :dish_id
      t.integer :size
      t.string :price

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
