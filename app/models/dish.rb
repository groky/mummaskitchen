class Dish < ActiveRecord::Base
  belongs_to :menu
  belongs_to :customerorder
  has_many :prices
  
  # todo - this is not DRY
  def prices(id)
    Price.find_all_by_dish_id(id)
  end
  
  # use this method to find specific dishes on the menu
  # this populates the dishes page after the menu is selected
  def self.freezer(menu_id, freezer)
    find(:all, 
          :select=>"DISTINCT \"dishes\".*", 
          :joins=>:prices, 
          :conditions=>"menu_id=#{menu_id} and freezer='#{freezer}'")
  end
  
  # use this method to access all the dishes in the freezer
  def self.freezerall
    find(:all, 
          :select=>"DISTINCT \"dishes\".*", 
          :joins=>:prices,
          :conditions=>"freezer='t'",
          :order=>"menu_id, dish_id")
  end

end
