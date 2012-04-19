class AddDishIdToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :dish_id, :integer
  end

  def self.down
    remove_column :photos, :dish_id
  end
end
