class Dish < ActiveRecord::Base
  belongs_to :menu
  belongs_to :customerorder
  has_many :prices
  
  # todo - this is not DRY
  def prices(id, where)
    Price.find(:all, :conditions=>"dish_id=#{id} and freezer='#{where}'")
  end
  
  def self.alldishes(menu_id=nil, page)
        if !menu_id.nil?
          dishes = find :all,
                    :select=>"DISTINCT \"dishes\".*",  
                    :conditions=>"menu_id=#{menu_id}"
        else
          dishes = find :all,
                    :select=>"DISTINCT \"dishes\".*"          
        end
        
       dishes.paginate  :per_page=>8, :page=>page 
  end
  
  # use this method to find specific dishes on the menu
  # this populates the dishes page after the menu is selected
  def self.freezer(menu_id, freezer, page)
    dishes = find :all, :select=>"DISTINCT \"dishes\".*", 
                  :joins=>:prices, 
                  :conditions=>"menu_id=#{menu_id} and freezer='#{freezer}'"
    
    dishes.paginate :per_page=>5, :page=>page

  end
  
  # use this method to access all the dishes in the freezer
  def self.freezerall(page)
    dishes = find :all, :select=>"DISTINCT \"dishes\".*", 
                  :joins=>:prices,
                  :conditions=>"freezer='t'",
                  :order=>"menu_id, dish_id"
    
    dishes.paginate :per_page=>5, :page=>page
          
  end
  
  def images(dish_id)
    Photos.find_all_by_dish_id(dish_id)
  end
  
  
  
end
