class ChangePricePriceToDecimal < ActiveRecord::Migration
  def self.up
    change_column :prices, :price, :decimal
  end

  def self.down
    change_column :prices, :price, :string
  end
end
