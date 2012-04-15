class AddMenuIdToDish < ActiveRecord::Migration
  def self.up
    add_column :dishes, :menu_id, :integer
  end

  def self.down
    remove_column :dishes, :menu_id
  end
end
