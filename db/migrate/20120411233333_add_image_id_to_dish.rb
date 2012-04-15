class AddImageIdToDish < ActiveRecord::Migration
  def self.up
    add_column :dishes, :image_id, :integer
  end

  def self.down
    remove_column :dishes, :image_id
  end
end
