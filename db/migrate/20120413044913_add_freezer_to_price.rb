class AddFreezerToPrice < ActiveRecord::Migration
  def self.up
    add_column :prices, :freezer, :boolean, :default=>false
  end

  def self.down
    remove_column :prices, :freezer
  end
end
