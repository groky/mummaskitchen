class UpdatePriceOnPricesToDecimal < ActiveRecord::Migration
  def self.up
    change_column :prices, :price, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    change_column :prices, :price, :string
  end
end
